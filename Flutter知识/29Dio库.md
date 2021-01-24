## Flutter Dio库 类似于Retrofit 需要封装

https://github.com/flutterchina/dio/blob/master/README-ZH.md#dio-apis

————————专业Dio文档

dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器等...

注意：dio 3.0.0为了支持Flutter Web，需要进行较大重构，因此无法直接兼容2.1.x， 如果你是2.1.x的用户，可以参照此文档升级到3.0，详情请查看 [从2.1升级到3.0指南](https://github.com/flutterchina/dio/blob/master/migration_to_3.0.md) 。

## 内容列表

- [示例](https://github.com/flutterchina/dio/blob/master/README-ZH.md#示例)
- [Dio APIs](https://github.com/flutterchina/dio/blob/master/README-ZH.md#dio-apis)
- [请求配置](https://github.com/flutterchina/dio/blob/master/README-ZH.md#请求配置)
- [响应数据](https://github.com/flutterchina/dio/blob/master/README-ZH.md#响应数据)
- [拦截器](https://github.com/flutterchina/dio/blob/master/README-ZH.md#拦截器)
- [Cookie管理](https://github.com/flutterchina/dio/blob/master/README-ZH.md#cookie管理)
- [错误处理](https://github.com/flutterchina/dio/blob/master/README-ZH.md#错误处理)
- [使用application/x-www-form-urlencoded编码](https://github.com/flutterchina/dio/blob/master/README-ZH.md#使用applicationx-www-form-urlencoded编码)
- [FormData](https://github.com/flutterchina/dio/blob/master/README-ZH.md#formdata)
- [转换器](https://github.com/flutterchina/dio/blob/master/README-ZH.md#转换器)
- [HttpClientAdapter](https://github.com/flutterchina/dio/blob/master/README-ZH.md#httpclientadapter)
- [设置Http代理](https://github.com/flutterchina/dio/blob/master/README-ZH.md#设置Http代理)
- [Https证书校验](https://github.com/flutterchina/dio/blob/master/README-ZH.md#Https证书校验)
- [Http2支持](https://github.com/flutterchina/dio/blob/master/README-ZH.md#Http2支持)
- [请求取消](https://github.com/flutterchina/dio/blob/master/README-ZH.md#请求取消)
- [继承 Dio class](https://github.com/flutterchina/dio/blob/master/README-ZH.md#继承-dio-class)
- [Features and bugs](https://github.com/flutterchina/dio/blob/master/README-ZH.md#features-and-bugs)

发起一个 `GET` 请求 :

```
Response response;
Dio dio = Dio();
response = await dio.get("/test?id=12&name=wendu")
print(response.data.toString());
// 请求参数也可以通过对象传递，上面的代码等同于：
response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
print(response.data.toString());
```

发起一个 `POST` 请求:

```
response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
```

发起多个并发请求:

```
response = await Future.wait([dio.post("/info"), dio.get("/token")]);
```

下载文件:

```
response = await dio.download("https://www.google.com/", "./xx.html");
```

以流的方式接收响应数据：

```
Response<ResponseBody> rs = await Dio().get<ResponseBody>(url,
  options: Options(responseType: ResponseType.stream), //设置接收类型为stream
);
print(rs.data.stream); //响应流
```

以二进制数组的方式接收响应数据：

```
Response<List<int>> rs = await Dio().get<List<int>>(url,
 options: Options(responseType: ResponseType.bytes), //设置接收类型为bytes
);
print(rs.data); //二进制数组
```

发送 FormData:

```
FormData formData = FormData.from({
    "name": "wendux",
    "age": 25,
  });
response = await dio.post("/info", data: formData);
```

通过FormData上传多个文件:

```
FormData.fromMap({
    "name": "wendux",
    "age": 25,
    "file": await MultipartFile.fromFile("./text.txt",filename: "upload.txt"),
    "files": [
      await MultipartFile.fromFile("./text1.txt", filename: "text1.txt"),
      await MultipartFile.fromFile("./text2.txt", filename: "text2.txt"),
    ]
 });
response = await dio.post("/info", data: formData);
```

监听发送(上传)数据进度:

```
response = await dio.post(
  "http://www.dtworkroom.com/doris/1/2.0.0/test",
  data: {"aa": "bb" * 22},
  onSendProgress: (int sent, int total) {
    print("$sent $total");
  },
);
```

以流的形式提交二进制数据：

```
// 二进制数据
List<int> postData = <int>[...];
await dio.post(
  url,
  data: Stream.fromIterable(postData.map((e) => [e])), //创建一个Stream<List<int>>
  options: Options(
    headers: {
      Headers.contentLengthHeader: postData.length, // 设置content-length
    },
  ),
);
```

注意：如果要监听提交进度，则必须设置content-length，反之则是可选的。

### 示例目录

你可以在这里查看dio的[全部示例](https://github.com/flutterchina/dio/tree/master/example).

## Dio APIs

### 创建一个Dio实例，并配置它

> 建议在项目中使用Dio单例，这样便可对同一个dio实例发起的所有请求进行一些统一的配置，比如设置公共header、请求基地址、超时时间等；这里有一个在[Flutter工程中使用Dio单例](https://github.com/flutterchina/dio/tree/master/example/flutter_example)（定义为top level变量）的示例供开发者参考。

你可以使用默认配置或传递一个可选 `BaseOptions`参数来创建一个Dio实例 :

```
Dio dio = Dio(); // 使用默认配置

// 配置dio实例
dio.options.baseUrl = "https://www.xx.com/api";
dio.options.connectTimeout = 5000; //5s
dio.options.receiveTimeout = 3000;

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
);
Dio dio = Dio(options);
```

Dio实例的核心API是 :

**Future request(String path, {data,Map queryParameters, Options options,CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress)**

```
  response = await request(
      "/test",
      data: {"id": 12, "name": "xx"},
      options: Options(method: "GET"),
  );
```