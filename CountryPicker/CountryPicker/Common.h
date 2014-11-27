
// 工具类
// .h文件通用宏
#define kInitH(name) \
- initWithDict:(NSDictionary *)dict; \
+ name##WithDict:(NSDictionary *)dict;

// .m文件通用宏
#define kInitM(name) \
+ (id)name##WithDict:(NSDictionary *)dict { \
    return [[self alloc] initWithDict:dict]; \
}