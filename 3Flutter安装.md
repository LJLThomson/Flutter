## Flutter配置

### 一 JDK配置

### 二 Android Studio配置

### 三Flutter SDK配置

1. 下载方式一

   ``` dart
   https://flutter.dev/docs/development/tools/sdk/releases?tab=windows
   
   https://flutter.cn/docs/get-started/install/windows  国内社区
   ```

2. 下载方式二

   ``` dart
   git clone -b stable https://github.com/flutter/flutter.git
   
    git clone https://github.com/flutter/flutter.git -b stable
   ```

### 四、安装配置

1. 找到 `flutter` 目录中的 **flutter_console.bat** 文件，双击执行该批处理脚本。

2. ### `flutter doctor`  cmd中输入

3. flutterdoctor--android-licenses  全部输入Y

### 五 flutter android studio无法搜索到插件问题

``` dart
https://www.tpxhm.com/fdetail/337.html
```

### 六配置镜像

```dart
FLUTTER_STORAGE_BASE_URL
    https://storage.flutter-io.cn

PUB_HOSTED_URL
    https://pub.flutter-io.cn

——————注意空格，默认会有空格，然后重启AS就可以了
```

### 七、AS编译问题

1. 第一步：

``` java
gradle必须大于
    但是我的还是不行，还是卡在Running Gradle task ‘assembleDebug’…，执行大概7分钟左右还是同样的错误提示，在百度查了半天的资料，查到的都是上面的同样的修改方法，问题没有解决。

3、然后到stackoverflow平台上搜索Running Gradle task ‘assembleDebug’，查到一个回答是说执行flutter clean，之后再run，提示gradle最小版本需要5.6.4，我电脑上原来是gradle5.6.2，于是直接安装了最新版的gradle6.3
在Settings里配置最新版的gradle
```

2. 第二步 \android\build.gradle:

   ``` java
   maven { url 'https://maven.aliyun.com/repository/google' }
   maven { url 'https://maven.aliyun.com/repository/jcenter' }
   maven { url 'http://maven.aliyun.com/nexus/content/groups/public' 
       
       
       buildscript {
       ext.kotlin_version = '1.3.71'
       repositories {
           //修改的地方
   //        google()
   //        jcenter()
           maven { url 'https://maven.aliyun.com/repository/google' }
           maven { url 'https://maven.aliyun.com/repository/jcenter' }
           maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
       }
    
       dependencies {
           classpath 'com.android.tools.build:gradle:3.6.3'
           classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
       }
   }
   allprojects {
       repositories {
           //修改的地方
   //        google()
   //        jcenter()
           maven { url 'https://maven.aliyun.com/repository/google' }
           maven { url 'https://maven.aliyun.com/repository/jcenter' }
           maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
       }
   }
   // 后文的配置不要改动
   rootProject.buildDir = '../build'
   subprojects {
       project.buildDir = "${rootProject.buildDir}/${project.name}"
   }
   subprojects {
       project.evaluationDependsOn(':app')
   }
    
   task clean(type: Delete) {
       delete rootProject.buildDir
   }
   ```

   3. 第三步

      ``` java
      \packages\flutter_tools\gradle\flutter.gradle:
      
      buildscript {
          repositories {
              //修改的地方
      //        google()
      //        jcenter()
              maven { url 'https://maven.aliyun.com/repository/google' }
              maven { url 'https://maven.aliyun.com/repository/jcenter' }
              maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
          }
          dependencies {
              classpath 'com.android.tools.build:gradle:3.5.0'
          }
      }
      // 后边的配置不要动
      android {
          compileOptions {
              sourceCompatibility 1.8
              targetCompatibility 1.8
          }
      }
      
      ```

      然后 run，等待下载

