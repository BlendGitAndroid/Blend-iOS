//
//  ViewController.m
//  02-内购
//
//  Created by dream on 15/12/19.
//  Copyright © 2015年 dream. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKProductsRequestDelegate, SKPaymentTransactionObserver>

/** 记录产品信息(商品列表)*/
@property (nonatomic, strong) NSArray *products;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 请求可售商品列表
    
    //1.1 创建商品标识符的无序集
    NSSet *set = [NSSet setWithObjects:@"com.itheima.heima4in.yaoshui", @"com.itheima.heima4in.dabaojian", nil];
    
    //1.2 创建商品请求对象
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:set];
    
    //1.3 设置代理 --> 老获取请求到的商品列表
    request.delegate = self;
    
    //1.4 开始请求
    [request start];
    
}

#pragma mark 此代理方法会返回请求后的结果信息
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    //2. 苹果会返回商品列表 --> 代理方法中返回的
    //如果标识符不正确, 会返回一个错误的array集合, 这个东西, 用户开发者调试用的
    //invalidProductIdentifiers: 无效标识符
    
    //2.1 判断是否有无效的标识符
    if (response.invalidProductIdentifiers.count > 0) {
        NSLog(@"invalidProductIdentifiers: %@", response.invalidProductIdentifiers);
    }
    
    //2.2 获取并保存产品列表
    self.products = response.products;
    
    //2.3 刷新表格
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    //1. 获取商品
    SKProduct *product = self.products[indexPath.row];
    
    //2. 显示商品信息
    cell.textLabel.text = product.localizedTitle;
    
    return cell;
}

#pragma mark 点击cell时, 开始进行购买
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //3. 选择之后, 开票据凭证
    //3.1 获取选中的商品
    SKProduct *product = self.products[indexPath.row];
    
    //3.2 开票据凭证
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    
    //4. 进入交易队列 -->单例不需要alloc创建
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}


//通知, 代理都是在视图出现时设置, 消失时取消

//通知, 假如2个控制器, 注册了同一个通知.  A B , B控制器发出的通知
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 视图将要出现时, 添加通知
    //5. 观察者对象监听支付流程 --> 一旦监听到购买行为时, 就会通过代理方法来返回相关信息
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 视图将要消失时, 移除通知
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions
{
    //6. 观察者的代理方法来监听支付
    
    //客户端必须结束交易, 如果不结束, 那么此交易一直在队列中
    /**
     SKPaymentTransactionStatePurchasing,    购买中
     SKPaymentTransactionStatePurchased,     购买完成 , 客户端必须结束交易
     SKPaymentTransactionStateFailed,        购买失败
     SKPaymentTransactionStateRestored,      恢复购买 , 客户端必须结束交易
     SKPaymentTransactionStateDeferred       无法判断 iOS8
     */
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"购买中");
                break;
                
            case SKPaymentTransactionStatePurchased:
                NSLog(@"购买完成");
                //结束交易
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                NSLog(@"购买失败");
                break;
                
            case SKPaymentTransactionStateRestored:
                //结束交易
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                NSLog(@"恢复购买");
                break;
                
            case SKPaymentTransactionStateDeferred:
                NSLog(@"无法判断");
                break;
                
            default:
                break;
        }
    }
}

#pragma mark 恢复购买按钮
- (IBAction)restroreClick:(id)sender {
    // 测试的时候可能不太正常, 测试时苹果服务器没有祝好购买项的保存操作
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}


@end
