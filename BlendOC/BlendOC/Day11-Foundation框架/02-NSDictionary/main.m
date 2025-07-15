/*
  1. NSArray与NSMutableArray 是OC中的数组.
     存储数据的特点:  每1个元素紧密相连.并且每1个元素中都是直接存储的值.
     缺点: 数组元素的下标不固定.都有可能会发生变化.无法通过下标来唯一确定数组中的元素.
 
     希望: 有一种存储数据的方式 存储到数组中.可以快速唯一的确定数组的元素.
 
     存储数据的时候.必须要为存储的数据取1个别名.
     这个别名的作用: 就是用来确定别名对应的数据的.
     要找存储在数组中的数据. 使用别名来找 而不是通过下标来找 因为下标有可能会发生变化.
 
     这种存储数据的方式 就叫做 键值对 的存储方式
 
     Key-Value
     Key 就是键 就是为数据取得别名.
     Value 就是值 就是真正存储的数据.
 
 
  2. NSDictionary 与 NSMutableDictionary
 
     1). 它们是数组. 它们就是以键值对的形式存储数据的.
         往这个数组中存储数据的同时.必须要指定这个数据的别名才可以.
         要找到存储在这个数组中的数据 通过别名来找 而不是通过下标.
 
 
     
  3. NSDictionary 字典数组
 
     1). 存储数据的原理.
         a. 以键值对的形式存储数据.
         b. 字典数组一旦创建,其中的元素就无法动态的新增和删除.
         c. 键: 只能是遵守了NSCoping协议的对象. 而NSString就是遵守了这个协议.
            值: 只能是OC对象.
 
     2). 创建字典数组
 
         NSDictionary *dict1 = [NSDictionary new];
         NSDictionary *dict2 = [[NSDictionary alloc] init];
         NSDictionary *dict3 = [NSDictionary dictionary];
 
         这种方式创建出来的字典数组中没有任何元素.所以没有意义.
 
     3). 一般创建方式
 
         + (instancetype)dictionaryWithObjectsAndKeys:(id)firstObject, ...
 
         将字典数组的值键 挨个的写在后面初始化.
 
         NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"北京市XX街道",@"address", nil];
 
        // OC的字典创建有点奇葩，value在前面，key在后面
 
 
     4). 简要创建方式.
            
         NSDictionary *dict = @{键1:值1,键2:值2,键3:值3,........};
         // 例如：
         NSDictionary *dict = @{@"name":@"rose",@"age":@"18",@"addredd":@"BeiJingXXSttreet"};
         简要的创建方式才是对的啊
 
 
  4. 使用字典数组.
 
     1). 如何取出存储在字典数组中的数据.
         a. 存储在字典数组中的元素不能使用下标去取 而是用键 也就是别名去取.
 
         -> 使用中括弧的方式.
            字典数组名[键]; 这样就可以去到字典数组中这个键对应的值.
 
            NSLog(@"%@",dict[@"name"]); 取出dict字典数组中@"name"这个键对应的值.
 
 
         -> 调用字典数组对象的方法也可以取出键对应的值.
 
           - (nullable ObjectType)objectForKey:(KeyType)aKey;
 
        如果给定的key在数组中不存在,取到的值是nil 不会报错.
 
 
     2). 取到字典数组的键值对的个数.
 
         @property (readonly) NSUInteger count;
 
 
     3). 往字典数组中存储键值对的时候 键不允许重复.

         如果键重复: 后加的无效.. ???????????????，记住这个是不可变的Dictionary，后加的无效
             

 
  5. 遍历字典数组
 
 
     1). 字典数组中的数据无法使用下标去取 所以普通的for循环遍历下标发就无用武之地了.
 
     2). 使用for in循环. 遍历出来的是字典数组中所有的键. 再通过键取出对应的值.
 
         NSDictionary *dict = @{
                 @"name":@"rose",
                 @"age":@"18",
                 @"address":@"BeiJingXXSttreet"
         };
         
         
         for(id item in dict)
         {
                NSLog(@"%@ = %@",item,dict[item]);
         }
 
    3). 使用block遍历.
         
 
         [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         
                NSLog(@"%@ = %@",key,obj);
         
         }];
 
 
 
  6. 字典数组存储数据的原理.
 
     1). 当往字典数组中存储1个键值对的时候,这个键值对应该存储在下标为几的元素中呢?
         -> 并不是按照顺序挨个挨个的存储的.
 
         -> 存储键值对的时候,会根据键和数组的长度做1个哈希算法.算出1个下标.将这个键值对存储在该下标处.
 
 
     2). 取值的时候:
         也是根据键做1个哈希算法.就可以算出这个键值对存储的下标 然后直接找到这个下标的数据取出就可以了.
 
 
 
     与NSArray对比
 
     1). NSArray数组的元素 挨个挨个的屁股后面. 按照顺序来存储的.
         字典数组中不是挨个挨个的存储的.存储的下标是算出来的.
 
 
     2). 存的效率: 肯定是NSArray要高一些.
         取得时候: 如果取值的时候,是全部一股脑的取出来.这个时候NSArray块一些.
                  如果取值的时候.只会取数组中指定的几个元素.字典数组取值更快一些.
         
 
 
    什么时候是有NSArray 什么时候使用字典数组?
 
    存储进去之后,一旦要取值.就是全部取出. NSArray
    存储进去之后.取值只会取指定的几个元素 字典数组.
 
 ---------------------------------------------------
 
 
 1. NSMutableDictionary
 
    1). 是NSDictionary的子类.所以NSMutableDictionary也是1个字典数组,也是以键值对的形式存储数据的.
 
    2). 重点:NSMutableDictionary在父类基础之上做的扩张:
 
        存储在其中的元素可以动态的新增和删除.
 
    3). 创建可变字典数组.
         NSMutableDictionary *dict1 = [NSMutableDictionary new];
         NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] init];
         NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
         
         这样创建出来的可变字典数组的长度为0 但是有意义 因为可以动态的新增和删除.
 
 
         NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"18",@"age", nil];
         在创建可变字典数组的同时初始化键值对.
 
         注意:  NSMutableDictionary *dict = @{}; 这样是不行的.
 
 
 2. 如何新增键值对.
 
    - (void)setObject:(ObjectType)anObject forKey:(KeyType <NSCopying>)aKey;
 
    如果键重复.后添加的就会替换原有的.
 
 3. 如何删除.
 
    - (void)removeAllObjects; 删除所有的键值对.
 
    - (void)removeObjectForKey:(KeyType)aKey; 删除指定的键值对.
 
 
 4. 也可以将字典数组的信息持久化起来.
 
    将字典数组的信息保存到plist文件中.
    - (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;

    从plist文件中还原回字典.
    + (nullable NSDictionary<KeyType, ObjectType> *)dictionaryWithContentsOfFile:(NSString *)path;
 
 
 
 
 */
#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/Apple/Desktop/dict.plist"];
    
    NSLog(@"%@",dict);
    
    
//    
//  NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"18",@"age", nil];
//    
//    
//    [dict setObject:@"广州市XX街" forKey:@"address"];
//    [dict setObject:@"187.1" forKey:@"height"];
//    
//    
//    
    [dict writeToFile:@"/Users/Apple/Desktop/dict.plist" atomically:NO];
    NSLog(@"YES");
    
    
    
    
    
    
    
//    [dict setObject:@"xiaoDong" forKey:@"name"];
//    [dict setObject:@"xiaoDongDong" forKey:@"name"];
    
    
//    NSLog(@"%@",dict);
//    
//    
//    
//    [dict removeObjectForKey:@"age"];
//    
//    
//       NSLog(@"%@",dict);
    
    
    
//    NSMutableDictionary *dict1 = [NSMutableDictionary new];
//    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] init];
//    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    
    
    
    
//    Person *p1 = [[Person alloc] initWithName:@"小明1"];
//    Person *p2 = [[Person alloc] initWithName:@"小明2"];
//    Person *p3 = [[Person alloc] initWithName:@"小明3"];
//    Person *p4 = [[Person alloc] initWithName:@"小明4"];
//    Person *p5 = [[Person alloc] initWithName:@"小明5"];
//    
//    NSArray *arr = @[p1,p2,p3,p4,p5];
//    
//    
//    
//    NSDictionary *dict = @{
//                p1.name:p1,
//                p2.name:p2,
//                p3.name:p3,
//                p4.name:p4,
//                p5.name:p5
//                };
//    
//    dict[@"小明3"];
    
    
    
    
    
//    NSDictionary *dict = @{
//                @"name":@"rose",
//                @"age":@"18",
//                @"address":@"BeiJingXXSttreet",
//                @"height":@"181",
//                @"weight":@"45",
//                @"zzz":@"xxx",
//                @"aa":@"aaaaaa"
//                };
//    
//    
//    //NSLog(@"%@",dict);//打印的顺序:按照键的ASCII.
//    
//    
//    
//    
//    
//    
//    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        
//        NSLog(@"%@ = %@",key,obj);
//        
//    }];
//    
//    NSLog(@"~~~~~~");
//    for(id item in dict)
//    {
//        NSLog(@"%@ = %@",item,dict[item]);
//    }
//
//    for(int i = 0; i < dict.count; i++)
//    {
//        NSLog(@"%@",dict[i]);
//    }
//    
    
    //NSLog(@"%lu", dict.count);
    
    //NSLog(@"%@",dict);
    
//    NSString *s1 =  [dict objectForKey:@"age1"];
//    
//    
//    
//    return 0;
    //NSLog(@"%@",);
    
    
    //NSLog(@"%@",dict[@"name"]);
    
    
    //NSLog(@"%@",dict);
    
    
    
    
    
    
//    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"北京市XX街道",@"address", nil];
//    
//    
//    
//    NSLog(@"%@",dict);
//    
    
    

    return 0;
}



