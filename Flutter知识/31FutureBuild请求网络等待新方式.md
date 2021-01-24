![在这里插入图片描述](https://img-blog.csdn.net/2018101111263439?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTEyNzI3OTU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

我们经常有这样的一个开发场景：一个页面进入之后先进行网络请求，此时显示一个圆圈(等待动画)，等网络数据返回时显示一个展示网络数据的布局。例如下图：



```
if(data==null){
	return CircularProgressIndicator();
}else{
	return ListView(...);
}
12345
```

大致就是数据返回之前我们加载一个组件，等数据返回值后，我们重绘页面返回另一个组件。
在flutter中，有一个新的实现方式，那就是我们即将要介绍的futureBuilder.

``` dart
https://blog.csdn.net/u011272795/article/details/83010974?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522160562928919724842932381%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=160562928919724842932381&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v28-1-83010974.pc_search_result_cache&utm_term=Flutter+FutureBuilder&spm=1018.2118.3001.4449
```

flutter FutureBuilder的使用以及防止FutureBuilder不必要重绘的两种方法



