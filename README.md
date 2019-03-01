# Third-party-libraries

1、CryptoSwift 是一个使用 Swift 编写的加密工具包，支持多种加密算法



2、Aspects是一个轻量级的面向切面编程的库。它主要提供了三个切入点:before(在原始的方法前执行)/instead(替换原始的方法执行)/after(在原始的方法后执行,默认)
//勾取一个类的所有实例的某一方法
+ (id<AspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(AspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error;

//勾取一个对象的某一方法
- (id<AspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(AspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error;





3、Alamofire就是对NSURLSession及其相关的东西进行了进一步的封装，让网络请求使用起来更为简单
AlamoFire是AF的Swift版本，其中虽然是使用Swift语言实现的，但是实现思路与AFNetWorking大同小异。   



4、AlamofireObjectMapper
使用ObjectMapper可以让JSON数据直接转化为对象，而使用Alamofire进行网络请求时，使用AlamofireObjectMapper可以直接返回对象，更加简洁。 


5、PermissionScopeDemo
权限管理类
