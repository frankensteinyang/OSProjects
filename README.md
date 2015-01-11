# MultithreadingProgramming
iOS MultithreadingProgramming.
<NSThread: 0x7a71f9a0>{number = 1, name = main}

pthread.h : 

NSThread :

线程的状态（生命周期）:
创建 内存 启动 
新建状态的线程不参与调度
可调度线程池在内存
start方法把线程放进线程池
新建>start 就绪>CPU调度>运行
线程阻塞，会被清除出调度池
死亡状态不代表被清除出内存，只是不在调度池
新建 就绪 运行 阻塞 死亡
