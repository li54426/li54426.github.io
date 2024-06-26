---
layout: blog
banana: true
category: API_software
title:  "jekyll进阶设置"
date:   2023-07-31 19:55:34
background: blue
tags:
- API_software
---

* content
{:toc}


### 0 jekyII + github pages 运行博客的问题

我的`typora`中的图片设置为`复制到assets文件夹下`，因此`github page`生成博客的时候会发生图片加载失败的问题。

- 这是上传到 gitee 云的 png 文件 加载失败

- 这是上传到 gitee 云的 webp 文件  加载**成功**



一共有两种解决方案

- 图片转换为 webp 文件，上传
- 存储到到固定目录下，如果你的图片存在根目录`assets`中`img`文件夹下，写相对位置`assets/img`，例如`![图片](assets/img/1.png)`
- 使用`base64`编码



- 在截屏快捷键截屏后直接复制 base64 编码到 Markdown 编辑器





#### 3.2 引用图片和其它资源

很多时候，你需要在文章中引用图片、下载或其它数字资源。尽管 Markdown 和 Textile 在链接这些资源时的语法并不一样，但你只需要关心在站点的哪些地方保存这些文件。

由于 Jekyll 的灵活性，有很多方式可以解决这个问题。一种常用做法是在工程的**根目录下创建一个文件夹**，命名为　`assets` 或者 `downloads`，将图片文件，下载文件或者其它的资源放到这个文件夹下。然后在任何一篇文章中，它们都可以用站点的根目录来进行引用。这和你站点的域名 / 二级域名和目录的设置相关，下面有一些例子（**Markdown 格式**）来演示怎样利用 `site.url` 变量来解决这个问题。

在文章中引用一个图片

```
… 从下面的截图可以看到：
![有帮助的截图]({{ site.url }}/assets/screenshot.jpg)
```

链接一个读者可下载的 PDF 文件：

```
… 你可以直接 [下载 PDF]({{ site.url }}/assets/mydoc.pdf).
```







### 1 简介

#### 1.1 Jekyll 究竟是什么？

Jekyll 是一个简单的博客形态的**静态站点**生产机器。它有一个模版目录，其中包含原始文本格式的文档，通过一个转换器（如 [Markdown](http://daringfireball.net/projects/markdown/)）和我们的 [Liquid](https://github.com/Shopify/liquid/wiki) 渲染器转化成一个完整的可发布的静态网站，你可以发布在任何你喜爱的服务器上。Jekyll 也可以运行在 [GitHub Page](http://pages.github.com/) 上，也就是说，你可以使用 GitHub 的服务来搭建你的项目页面、博客或者网站，而且是**完全免费**的。

站点内容页面，可以使用 `markdown` 或 `html` 来编写，但 markdown 编写的 md 文件，在浏览器地址访问的时候依然使用 html 文件后缀。且html优先级更高

[官方文档](http://jekyllcn.com/docs/)



```bash
$ jekyll build
# => 当前文件夹中的内容将会生成到 ./_site 文件夹中。

$ jekyll build --destination <destination>
# => 当前文件夹中的内容将会生成到目标文件夹<destination>中。

$ jekyll build --source <source> --destination <destination>
# => 指定源文件夹<source>中的内容将会生成到目标文件夹<destination>中。

$ jekyll build --watch
# => 当前文件夹中的内容将会生成到 ./_site 文件夹中，
#    查看改变，并且自动再生成。
```





#### 1.2 目录结构

```
.
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _site
├── .jekyll-metadata
└── index.html
```

- `config.yml` 里写有整个站点的主要配置项
- `_includes` 可以在模板中随时包含的文件
- `_layouts` 布局文件，在博客头配置中可以选择
- `_posts` 下的所有目录中的所有博客

注意: .yml 文件中，字段的冒号后面**必须有空格**！





### 2 头部信息(设置信息)

#### 2.1 头信息

| 变量名称    | 描述                                                         |
| ----------- | ------------------------------------------------------------ |
| `layout`    | 如果设置的话，会指定**使用该模板文件**。指定模板文件时候不需要文件扩展名。模板文件必须放在 `_layouts` 目录下。 |
| `permalink` | 如果你需要让你发布的博客的 URL 地址**不同于默认值** `/year/month/day/title.html`，那你就设置这个变量，然后变量值就会作为最终的 URL 地址。 |
| `published` | 如果你**不想**在站点生成后**展示**某篇特定的博文，那么就设置（该博文的）该变量为 false。 |
| `date`      | 这里的日期会**覆盖文章名字中的日期**。这样就可以用来保障文章排序的正确。日期的具体格式为 `YYYY-MM-DD HH:MM:SS +/-TTTT`；时，分，秒和时区都是可选的。 |
| `category`  | 除过将博客文章放在某个文件夹下面外，你还可以指定博客的一个或者多个分类属性。这样当你的站点生成后，这些文章就可以根据这些分类来阅读。`categories` 可以通过 [YAML list](http://en.wikipedia.org/wiki/YAML#Lists)，或者以逗号隔开的字符串指定。 |
| `tags`      | 类似分类 `categories`，一篇文章也可以给它增加**一个或者多个**标签。同样，`tags` 可以通过 YAML 列表或者以逗号隔开的字符串指定。 |



#### 2.2 格式

传统的块格式使用连字符 + 空格来开始列表中的新项目。

```
--- # Favorite movies
- Casablanca
- North by Northwest
- The Man Who Wasn't There
```

可选的内联格式由逗号+空格分隔，并括在括号中

```
--- # Shopping list
[milk, pumpkin pie, eggs, juice]
```









#### 2.3 默认值

假设您想添加一个默认的布局给站点中的所有页面和文章。 你要将这添加到你的 `_config.yml` 文件：

```bash
defaults:
  -
    scope:
      path: ""
      type: "posts"
    values:
      layout: "my-site"
  -
    scope:
      path: "projects"
      type: "pages" # 以前的 `page`， 在 Jekyll 2.2 里。
    values:
      layout: "project" # 覆盖之前的默认布局
      author: "Mr. Hyde"

```











#### 2.4 路径的组织方式

总体设置

```yaml
#产生路径方式
permalink: pretty
permalink: /:categories/:title.html
# 可以使用分类的方式
permalink:        /:categories/:title.html

# 这是默认的方式
permalink: /:year/:month/:day/:title.html
https://xxxx.github.io/algorithm/2023/07/30/problem-string/

```



单独设置

```yaml
---
permalink: /about/
---

```



| Permalink Style | URL Template                                                 |
| --------------- | ------------------------------------------------------------ |
| `date`          | `/:categories/:year/:month/:day/:title:output_ext`           |
| `pretty`        | `/:categories/:year/:month/:day/:title/`                     |
| `ordinal`       | `/:categories/:year/:y_day/:title:output_ext`                |
| `weekdate`4.0   | `/:categories/:year/W:week/:short_day/:title:output_ext` (`W` will be prefixed to the value of `:week`) |
| `none`          | `/:categories/:title:output_ext`                             |







### 3 其他

#### 3.1 github 某些 样式

- [Jekyll Themes](http://jekyllthemes.org/)
- [cotes2020/jekyll-theme-chirpy：一个用于技术写作的最小、响应迅速且功能丰富的 Jekyll 主题。 (github.com)](https://github.com/cotes2020/jekyll-theme-chirpy)
- [博客模板 1](https://github.com/Liberxue/liberxue.github.io) 
- [artemsheludko/bef: Bef is a responsive jekyll theme https://artemsheludko.github.io/bef/](https://github.com/artemsheludko/bef)
- [leopardpan/leopardpan.github.io: 个人博客，看效果进入](https://github.com/leopardpan/leopardpan.github.io)
- [再用 2023 依旧更新](https://github.com/jeffreytse/jekyll-theme-yat/tree/master)









- 



