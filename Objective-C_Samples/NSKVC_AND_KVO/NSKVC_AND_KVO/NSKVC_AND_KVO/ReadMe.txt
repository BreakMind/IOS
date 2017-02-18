Objective-C KVC/KVO学习

KVC提供了一种简介存取对象属性的方法。与KVC相关的方法都是在NSObject中定义的，所以所有继承自NSObject的子类都具有KVC功能。

KVO则是提供了一种观察指定对象属性的方法，当观察的对象的属性发生变化，观察者会收到通知。
---------------------------------------------------------------------------------------------------

Key-Value Coding(KVC)

KVC，指的是NSKeyValueCoding，一个非正式的Protocol。它最强大的功能是自由存取对象的属性，即使该属性值对外是不可见的(即那些没有在.h文件中声明的属性或没提供getter/setter的私有属性)。并且KVO也是基于KVC实现的。Cocoa框架，Core data中也有KVC的应用。

一个对象可能拥有很多属性，并且这些属性有可能是外部可以直接访问的，或者是私有的属性。key只是一个字符串，它对用的值可以是任意对象，而且必须是对象（属性为基本类型的需要NSNumber等进行封装。

）

代码说明：
TestAuto：自动观察
TestManual：手动观察




相关资料：
http://lysongzi.com/2016/02/28/iOS-KVC-KVO%E5%AD%A6%E4%B9%A0/
