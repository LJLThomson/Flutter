## Flutter进阶第1篇： http get请求数据、post提交数据、以及渲染动态数据

### 1.json和String相互转换

``` dart
Map userInfo = {
    "username":"张三",
    "age":20
}

json.decode(result.body); //json字符串(String) 转换为map
json.encode(userInfo); // map类型转换为String
```

### 2.http库

``` dart
依赖：  http: ^0.12.2
    
安装：flutter packages get
导入：import 'package:http/http.dart' as http;
```

``` dart
常用方法

get(dynamic url, { Map<String, String> headers }) → Future<Response>
(必须)url:请求地址
(可选)headers:请求头
    
post(dynamic url, { Map<String, String> headers, dynamic body, Encoding encoding }) → Future<Response>
(必须)url:请求地址
(可选)headers:请求头
(可选)body:参数
(编码)Encoding:编码 默认UTF-8
例子
```

### 3.自定义头信息

```dart
class UserAgentClient extends http.BaseClient {
  final String userAgent;
  final http.Client _inner;

  UserAgentClient(this.userAgent, this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = userAgent;
    return _inner.send(request);
  }
}
```

### 4.MultipartRequest使用

``` dart
var uri = Uri.parse("http://pub.dartlang.org/packages/create");
var request = new http.MultipartRequest("POST", uri);
request.fields['user'] = 'nweiz@google.com';
request.files.add(new http.MultipartFile.fromPath(
     'package',
     'build/package.tar.gz',
     contentType: new MediaType('application', 'x-tar'));
var response = await request.send();
if (response.statusCode == 200) print('Uploaded!');
```

``` dart
在MultipartRequest中，fields是一个Map；files是一个MultipartFile的List：

/// The form fields to send for this request.
final Map<String, String> fields;

/// The private version of [files].
final List<MultipartFile> _files;
/// The list of files to upload for this request.
List<MultipartFile> get files => _files;

fields里存储的key-value就是body中的文本字段，key是name，value是内容。files里存储的就是需要上传的文件，MultipartFile有两个命名构造方法和一个静态方法：

/// Creates a new [MultipartFile] from a byte array.
///
/// [contentType] currently defaults to `application/octet-stream`, but in the
/// future may be inferred from [filename].
factory MultipartFile.fromBytes(String field, List<int> value, {String filename, MediaType contentType})

  /// Creates a new [MultipartFile] from a string.
  ///
  /// The encoding to use when translating [value] into bytes is taken from
  /// [contentType] if it has a charset set. Otherwise, it defaults to UTF-8.
  /// [contentType] currently defaults to `text/plain; charset=utf-8`, but in
  /// the future may be inferred from [filename].
factory MultipartFile.fromString(String field, String value, {String filename, MediaType contentType})


// TODO(nweiz): Infer the content-type from the filename.
/// Creates a new [MultipartFile] from a path to a file on disk.
///
/// [filename] defaults to the basename of [filePath]. [contentType] currently
/// defaults to `application/octet-stream`, but in the future may be inferred
/// from [filename].
///
/// Throws an [UnsupportedError] if `dart:io` isn't supported in this
/// environment.
static Future<MultipartFile> fromPath(String field, String filePath, {String filename, MediaType contentType})
最后调用MultipartRequest中的send方法会将fields和files中的内容按照格式生成body，然后发送POST请求。

需要注意的是request.send()返回的是StreamedResponse，和普通的Response还不一样，需要用如下方法才能读取内容：

var respStr = await response.stream.transform(utf8.decoder).join();
LogUtil.i("upload response is $respStr");
```

``` dart
Flutter请求抓包问题
一般做HTTP请求都会想要抓包来看一下请求的格式和内容对不对，但是这次连上代理以后发现其他请求都能抓到，只有Flutter里的请求抓不到…
上网搜索了一下，发现已经有人遇到过这个问题，并给出了解决方案，具体的分析这里就不再贴了，详情请看Flutter中http请求抓包解决方案。这里只写一下结论，增加如下代码就可以抓包了，"http_proxy"填代理PC的IP和端口即可。

var httpClient = new HttpClient();
httpClient.findProxy = (url) {
    return HttpClient.findProxyFromEnvironment(url, environment: {"http_proxy": 'http://192.168.124.7:8888',});
};

但是有一个问题，我们用的是http插件，不是原生的HttpClient，这又应该怎么设置呢？
遇事不决读源码，在http中的client.dart里，我看到这样的注释：

/// Creates a new client.
///
/// Currently this will create an `IOClient` if `dart:io` is available and
/// a `BrowserClient` if `dart:html` is available, otherwise it will throw
/// an unsupported error.

意思是如果有dart:io，就会创建一个IOClient；如果有dart:html，就会创建一个BrowserClient。HttpClient正是dart:io中的一员，所以我们来看看IOClient的实现：

/// The underlying `dart:io` HTTP client.
  HttpClient _inner;

  /// Creates a new HTTP client.
  IOClient([HttpClient inner]) : _inner = inner ?? new HttpClient();

这就很清晰了，IOClient实际就是HttpClient的封装，那我们只要自己创建一个HttpClient设置好代理后再创建IOClient就可以了，所以我们完整的上传代码就是：

  static Future<bool> upload(BaseUploadData data) async {
    var request = await data.getRequest();
    HttpClient httpClient = new HttpClient();
    httpClient.findProxy = (url) {
      return HttpClient.findProxyFromEnvironment(url, environment: {"http_proxy": 'http://10.45.109.70:8088',});
    };
    IOClient client = IOClient(httpClient);
    var response = await client.send(request);
    var respStr = await response.stream.transform(utf8.decoder).join();
    LogUtil.i("upload response is $respStr");
    return response.statusCode == 200;
  }
```

### 5. form-data

模拟表单上传

``` dart
Future<String> postFormData(String url, Map<String, String> headers,
      Map<String, String> params, Map<String, File> files) async {
    Completer<String> completer = Completer();

    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.fields.addAll(params);
    files.forEach((k, v) {
      var partFile = http.MultipartFile(
        k,
        v.readAsBytes().asStream(),
        v.lengthSync(),
      );
      request.files.add(partFile);
    });

    var ioClient = http.IOClient();
    var response = await ioClient.send(request);

    List<int> responseBody = [];

    response.stream.listen((data) {
      responseBody.addAll(data);
    }, onDone: () {
      var string = String.fromCharCodes(responseBody);
      completer.complete(string);
    }, onError: (err) {
      completer.completeError(err);
    });

    return completer.future;
  }
```

### x-www-form-urlencoded

这个也是

```java
  Future<http.StreamedResponse> xWwwFormUrlencoded(
      String url, Map<String, String> params) {
    var request = http.Request("POST", Uri.parse(url));
    request.bodyFields = params;
    return request.send();
  }
123456
```

这里只需要简单的使用 bodyFild 设置 params 即可

参考源码可知
![图片](https://ws1.sinaimg.cn/large/844036b9ly1fy1n41816xj20yw0ayacd.jpg)

当 contentType 为空的时候会自动设置 contentType 为`x-www-form-urlencoded`

### raw(文本)

![20190219134256.png](https://raw.githubusercontent.com/kikt-blog/image/master/img/20190219134256.png)

这里有多种选择的原因是因为:有的时候部分第三方接口可能支持xml/json/protobuf等多种交互方案

### 流(binary 二进制)

其实目前很多的 api 接口对于 contentType 并不敏感,单纯的接收一个数据/图片或其他的信息,然后返回值

```java
  Future<http.StreamedResponse> streamRequest(
      String url, List<int> streamContent) {
    var request = http.StreamedRequest("POST", Uri.parse(url));
    request.sink.add(streamContent);
    return request.send();
  }
```





https://blog.csdn.net/qq_28478281/article/details/87282494?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522160562526819724842937601%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=160562526819724842937601&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v28-5-87282494.pc_search_result_cache&utm_term=Flutter+http&spm=1018.2118.3001.4449

————————Http比较好的讲解

https://blog.csdn.net/jay100500/article/details/88386470?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522160562322619724835837989%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=160562322619724835837989&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_v2~rank_v28-1-88386470.pc_search_result_cache&utm_term=Flutter+http+get%E8%AF%B7%E6%B1%82%E6%95%B0%E6%8D%AE&spm=1018.2118.3001.4449

—————————有相应Http讲解

``` dart
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class DartHttpUtils {
  //创建client实例
  var _client = http.Client();

  //发送GET请求
  getClient() async {
    var url = "https://abc.com:8090/path1?name=abc&pwd=123";
    _client.get(url).then((http.Response response) {
      //处理响应信息
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    });
  }

//发送POST请求，application/x-www-form-urlencoded
  postUrlencodedClient() async {
    var url = "https://abc.com:8090/path2";
    //设置header
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = "application/x-www-form-urlencoded";
    //设置body参数
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    _client
        .post(url, headers: headersMap, body: bodyParams, encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

  //发送POST请求，application/json
  postJsonClient() async {
    var url = "https://abc.com:8090/path3";
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    _client
        .post(url,
            headers: headersMap,
            body: jsonEncode(bodyParams),
            encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

  // 发送POST请求，multipart/form-data
  postFormDataClient() async {
    var url = "https://abc.com:8090/path4";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    client.fields["name"] = "value1";
    client.fields["pwd"] = "value2";
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print('error');
      }
    }).catchError((error) {
      print('error');
    });
  }

// 发送POST请求，multipart/form-data，上传文件
  postFileClient() async {
    var url = "https://abc.com:8090/path5";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    http.MultipartFile.fromPath('file', 'sdcard/img.png',
            filename: 'img.png', contentType: MediaType('image', 'png'))
        .then((http.MultipartFile file) {
      client.files.add(file);
      client.fields["description"] = "descriptiondescription";
      client.send().then((http.StreamedResponse response) {
        if (response.statusCode == 200) {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        } else {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        }
      }).catchError((error) {
        print(error);
      });
    });
  }
  ///其余的HEAD、PUT、DELETE请求用法类似，大同小异，大家可以自己试一下
  ///在Widget里请求成功数据后，使用setState来更新内容和状态即可
  ///setState(() {
  ///    ...
  ///  });
}
```



