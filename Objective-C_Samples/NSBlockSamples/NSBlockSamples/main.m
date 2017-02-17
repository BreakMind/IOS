#import <Foundation/Foundation.h>

int GetData(int a1, int a2);

// 定义一个block
typedef int(^BLOCK_FUNCTION_1) (int a1, int a2);
int Block_GetData(int a1, int a2, BLOCK_FUNCTION_1 b);


int main(int argc, char * agrv[])
{
    @autoreleasepool {
        // block
        
        //================================================================================
        // 定义 block类型,普通block调用
        typedef int (^ BLOCK_FUNCTION)(int a1, int a2);
        
        //block实现
        BLOCK_FUNCTION bFunction = ^(int a1, int a2){return a1+a2;};
        NSLog(@"%d", bFunction(10,10));
        
        //================================================================================
        //直接在函数参数中定义bloc
        NSLog(@"%d", Block_GetData(5,3,^(int a, int b){ return a+b;}));
        
        //================================================================================
        // 定义函数指针，并且调用函数
        typedef int(*Function)(int a1, int a2);
        Function f = GetData;
        NSLog(@"%d", f(10, 5));
    }
    return 0;
}

int GetData(int a1, int a2)
{
    return a1+a2;
}

int Block_GetData(int a1, int a2, BLOCK_FUNCTION_1 b)
{
    return b(a1, a2);
}
