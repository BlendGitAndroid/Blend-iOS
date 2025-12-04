#import "HMHelpWebController.h"
#import <WebKit/WebKit.h>

@interface HMHelpWebController () <WKNavigationDelegate>
@property(nonatomic, strong) WKWebView *webView;
@property(nonatomic, strong) UIActivityIndicatorView *loadingView;
@end

@implementation HMHelpWebController

#pragma mark - Lifecycle

- (void)loadView {
    [self setupWebView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadContent];
}

- (void)dealloc {
    [self.webView stopLoading];
    self.webView.navigationDelegate = nil;
}

#pragma mark - Setup

- (void)setupWebView {
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];

    // 配置偏好设置
    WKPreferences *preferences = [[WKPreferences alloc] init];
    preferences.javaScriptEnabled = YES;
    preferences.javaScriptCanOpenWindowsAutomatically = NO;
    config.preferences = preferences;

    // 创建 WebView
    self.webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds
                                      configuration:config];
    self.webView.navigationDelegate = self;
    self.webView.autoresizingMask =
        UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    self.view = self.webView;
}

- (void)setupUI {
    self.title = self.help.title ?: @"帮助";

    // 如果是模态显示，添加关闭按钮
    if (self.presentingViewController) {
        self.navigationItem.leftBarButtonItem =
            [[UIBarButtonItem alloc] initWithTitle:@"关闭"
                                             style:UIBarButtonItemStylePlain
                                            target:self
                                            action:@selector(closeAction)];
    }

    // 添加分享按钮（如果需要）
    if (self.help.shareable) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                 target:self
                                 action:@selector(shareAction)];
    }
}

#pragma mark - Content Loading

- (void)loadContent {
    if (![self validateContent]) {
        return;
    }

    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:self.help.html
                                             withExtension:nil];
    if (!fileURL) {
        [self showError:@"无法找到帮助文件"];
        return;
    }

    [self showLoading];
    [self.webView loadFileURL:fileURL
        allowingReadAccessToURL:[fileURL URLByDeletingLastPathComponent]];
}

- (BOOL)validateContent {
    if (!self.help.html) {
        [self showError:@"内容文件不存在"];
        return NO;
    }

    if (!self.help.title) {
        NSLog(@"警告：帮助标题为空");
    }

    return YES;
}

#pragma mark - WKNavigationDelegate

- (void)webView:(WKWebView *)webView
    didFinishNavigation:(WKNavigation *)navigation {
    [self hideLoading];

    // 跳转到指定锚点
    if (self.help.ids && self.help.ids.length > 0) {
        NSString *jsCode = [NSString
            stringWithFormat:@"window.location.hash = '%@';", self.help.ids];
        [webView evaluateJavaScript:jsCode completionHandler:nil];
    }
}

- (void)webView:(WKWebView *)webView
    didFailNavigation:(WKNavigation *)navigation
            withError:(NSError *)error {
    [self hideLoading];
    [self handleLoadError:error];
}

- (void)webView:(WKWebView *)webView
    didFailProvisionalNavigation:(WKNavigation *)navigation
                       withError:(NSError *)error {
    [self hideLoading];
    [self handleLoadError:error];
}

#pragma mark - Helper Methods

- (void)showLoading {
    if (!self.loadingView) {
        self.loadingView = [[UIActivityIndicatorView alloc]
            initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
        self.loadingView.center = self.view.center;
        [self.view addSubview:self.loadingView];
    }
    [self.loadingView startAnimating];
}

- (void)hideLoading {
    [self.loadingView stopAnimating];
    [self.loadingView removeFromSuperview];
    self.loadingView = nil;
}

- (void)handleLoadError:(NSError *)error {
    NSString *message = @"加载失败，请稍后重试";

    if ([error.domain isEqualToString:NSURLErrorDomain]) {
        switch (error.code) {
        case NSURLErrorNotConnectedToInternet:
            message = @"网络连接失败，请检查网络设置";
            break;
        case NSURLErrorTimedOut:
            message = @"请求超时，请重试";
            break;
        case NSURLErrorFileDoesNotExist:
            message = @"文件不存在";
            break;
        }
    }

    [self showError:message];
}

- (void)showError:(NSString *)message {
    UIAlertController *alert = [UIAlertController
        alertControllerWithTitle:@"提示"
                         message:message
                  preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *confirmAction =
        [UIAlertAction actionWithTitle:@"确定"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *_Nonnull action) {
                                 [self navigateBack];
                               }];

    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)navigateBack {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - Actions

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)shareAction {
    // 实现分享功能
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:self.help.html
                                             withExtension:nil];
    if (fileURL) {
        UIActivityViewController *activityVC = [[UIActivityViewController alloc]
            initWithActivityItems:@[ self.help.title ?: @"帮助文档", fileURL ]
            applicationActivities:nil];
        [self presentViewController:activityVC animated:YES completion:nil];
    }
}

@end
