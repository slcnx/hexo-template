---
title: 快速搭建自己的个人博客
tags:
  - git
date: 2022-05-13 08:50:48
---

# 前言

完全免费

1. 通过**淘宝账号**登陆, `codeup.aliyun.com`,  免费。
2. 登陆 `github.com` ，注册一个账号，免费。我这里账号是`slcnx`

3. 安装windows git,  https://gitforwindows.org/ 下载之后，直接安装。

   需要先验证git, windows 打开 `CMD` , 输入 `git --version` **看到**版本号，说明git安装OK

   ![image-20220513093045210](README/image-20220513093045210.png)

4. 安装windows node,  https://nodejs.org/en/download/ 下载之后，直接安装

   需要先验证node, windows 打开 `CMD` , 输入 `node --version` **看到**版本号，说明node安装OK

   ![image-20220513093341959](README/image-20220513093341959.png)

5. 安装vscode, https://code.visualstudio.com/ 下载之后，直接安装
6. 安装typora, https://typora.io/releases/all 下载, 直接安装

<!--more-->



# 准备hexo基础模板

克隆git, 在CMD执行, 以下目录

```
git clone --recurse-submodules https://github.com/slcnx/hexo-template.git blog
```

> 不成功多执行几次， 当看到100% 就表示成功了

![image-20220513094643815](README/image-20220513094643815.png)

现在进入克隆目录

```
cd blog
```

![image-20220513093934096](README/image-20220513093934096.png)

克隆子项目`git submodule update --init --recursive`

![image-20220513094748529](README/image-20220513094748529.png)

现在安装依赖` npm install`

![image-20220513095055192](README/image-20220513095055192.png)

现在在命令行输入 `start .`

![image-20220513093954383](README/image-20220513093954383.png)

看到以下界面

![image-20220513094013505](README/image-20220513094013505.png)



# vscode打开目录, 运行服务

回到上一级目录，`blog`目录, 右键 **通过 Code** 打开

![image-20220513094214889](README/image-20220513094214889.png)



进入到以下界面

![image-20220513094228729](README/image-20220513094228729.png)



现在安装插件, 并退出vscode程序，之后重新 `blog`目录, 右键 **通过 Code** 打开

![image-20220513094320097](README/image-20220513094320097.png)



现在快捷键 **ctrl + shift + `**  运行  **npx hexo s** 

![image-20220513095212339](README/image-20220513095212339.png)

访问本地的4000 http://localhost:4000/

![image-20220513095237808](README/image-20220513095237808.png)



# github准备

## 准备github仓库

查看自己的账号名 , 我的为 `slcnx`

![image-20220513095332738](README/image-20220513095332738.png)



新建仓库  `slcnx.github.io` 格式是`用户名.github.io`

![image-20220513095640820](README/image-20220513095640820.png)

![image-20220513095652519](README/image-20220513095652519.png)

## 添加一个测试文件

![image-20220513095752726](README/image-20220513095752726.png)





一定要添加`index.html`

![image-20220513095822054](README/image-20220513095822054.png)

添加之后，刷新网页，过3分钟的样子，右下角出现 active

![image-20220513095942064](README/image-20220513095942064.png)

访问网页 https://slcnx.github.io  `用户名.github.io`

![image-20220513100016239](README/image-20220513100016239.png)

现在表示github.com已经正常



## 配置github

![image-20220513100103791](README/image-20220513100103791.png)

![image-20220513100129679](README/image-20220513100129679.png)

现在需要生成一个公钥和密钥`ssh-keygen -t rsa -b 4096 -f id_rsa_2048 -P ''` 命令一定要对

> 此处一定要在`Linux`主机上生成。之后下载 id_rsa_2048 id_rsa_2048.pub 到本地 博客blog目录



vscode中查看公钥，复制公钥

![image-20220513100509093](README/image-20220513100509093.png)

![image-20220513100606627](README/image-20220513100606627.png)

看到以下内容表示OK

![image-20220513100630996](README/image-20220513100630996.png)



## 获取github的ssh地址

![image-20220513100825116](README/image-20220513100825116.png) 

`git@github.com:slcnx/slcnx.github.io.git`

有docker的同学可以, 可以运行以下命令验证是否正常。<b style="color: red;">没有docker的同学，就不需要执行以下命令</b>

```
docker build --build-arg GITHUB=git@github.com:slcnx/slcnx.github.io.git --build-arg EMAIL='2192383945@qq.com' --build-arg GUSER='songliangcheng' ./
```

# codeup准备

## 准备codeup仓库

![image-20220513101358650](README/image-20220513101358650.png)

![image-20220513101431944](README/image-20220513101431944.png)

获取https地址 `https://codeup.aliyun.com/5f73e5a3728df4b180fab5ca/myblog-2022-05-13.git`

![image-20220513101457691](README/image-20220513101457691.png)

## 本地推送代码

先在blog目录中， 即进入CMD中，在blog目录中

```
git remote set-url origin https://codeup.aliyun.com/5f73e5a3728df4b180fab5ca/myblog-2022-05-13.git
```

![image-20220513101730325](README/image-20220513101730325.png)

推送代码, 双击push.sh

![image-20220513101816443](README/image-20220513101816443.png)

代码仓库, 已经有数据了

![image-20220513101839833](README/image-20220513101839833.png)

## 添加流水线

### 进入流水线页面

![image-20220513101902870](README/image-20220513101902870.png)

![image-20220513101910710](README/image-20220513101910710.png)

![image-20220513101941108](README/image-20220513101941108.png)

### 配置流水线

因为代码中有submodule, 就启用

![image-20220513102015626](README/image-20220513102015626.png)

定义构建镜像

![image-20220513102242848](README/image-20220513102242848.png)

![image-20220513102317624](README/image-20220513102317624.png)

配置构建参考，**非常关键**, 这里有3个参数

```bash
EMAIL       你的QQ邮箱 
GUSER       你的用户名，任意
GITHUB      这里一定是你上面github创建的仓库的ssh地址，参考4.4获取githubssh地址。我的为 git@github.com:slcnx/slcnx.github.io.git
```

![image-20220513103303012](README/image-20220513103303012.png)

不需要发布所以删除kubernetes

![image-20220513102349111](README/image-20220513102349111.png)

保存并运行

![image-20220513102407557](README/image-20220513102407557.png)

### 运行流水线

![image-20220513102417620](README/image-20220513102417620.png)

### 查看日志

![image-20220513102440868](README/image-20220513102440868.png)

![image-20220513103852668](README/image-20220513103852668.png)

### 查看github.com

![image-20220513103918387](README/image-20220513103918387.png)

# 查看网页

https://slcnx.github.io/

![image-20220513102518346](README/image-20220513102518346.png)



# 写新的文章

## 添加文章

运行`addarticle.sh`脚本, 写标题  **第3个文章**



![image-20220513102558031](README/image-20220513102558031.png)

会自动弹出博客编写页面 编写**第3个文章**

![image-20220513103034036](README/image-20220513103034036.png)

![image-20220513103100965](README/image-20220513103100965.png)

```
---
title: 第3个文章
tags:
  - linux
categories:
  - hexo
date: 2022-05-13 10:26:14
---

# 背景

hello

![image-20220513102937310](第3个文章/image-20220513102937310.png)

<!--more-->
```



## 发布文章

运行push.sh脚本

![image-20220513102729742](README/image-20220513102729742.png)

## 查看网页

![image-20220513104016387](README/image-20220513104016387.png)

# 自定义网页样式

[本地开发](https://slcnx.github.io/2022/05/12/%E5%85%8D%E8%B4%B9%E6%90%9E%E7%BD%91%E7%AB%99-gitpages/#%E5%BC%80%E5%8F%91%E6%96%B9%E5%BC%8F)