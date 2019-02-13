## [R-pkg CMD Memo](https://r-pkgs.org/)

### 1.包的结构

```
.
├── .Rbuildignore
├── .git
├── .gitignore
├── CODE_OF_CONDUCT.md
├── DESCRIPTION
├── LICENSE
├── LICENSE.md
├── NAMESPACE
├── NEWS.md
├── R
│   └── utils.R
├── README.Rmd
├── README.md
├── data-raw
│   └── devstuffs.R
├── man
│   └── func_name.Rd
├── rdevt.Rproj
└── tests


```

#### 1.1 `.Rbuildignore` ：

```
^README\.Rmd$
^CODE_OF_CONDUCT\.md$
^LICENSE\.md$
^data-raw$
^.*\.Rproj$
^\.Rproj\.user$
```

添加文件名到 .Rbuildignore
```
# run in rstudio console
devtools::use_build_ignore("key_word")
```

#### 1.2 [`DESCRIPTION`](https://r-pkgs.org/description.html)：


> a. 新建 `R` 包项目时自动生成描述文件;

> b. 使用 `usethis::use_description()` 创建标准模版描述文件;

> c. `desc::description` 个性化创建和设置描述文件

```
Package: rdevt
Title: R Dev Test pkg
Version: 0.1.0
Authors@R: 
    person(given = "Ashley",
           family = "Lee",
           role = c("cre", "aut"),
           email = "contact@email.com")
Description: Try to develop an r-pkg.
License: MIT + file LICENSE
URL: http://this
BugReports: http://that
Imports: 
    attempt,
    curl,
    httr,
    jsonlite,
    purrr
Encoding: UTF-8
LazyData: true
RoxygenNote: 6.1.1
Suggests: 
    testthat,
    knitr,
    rmarkdown
VignetteBuilder: knitr
```

>Imports（输入）： 必须安装的依赖包

>Suggests（建议）

添加 `Imports` 和 `Suggests` : 
```
# 默认添加到Imports
usethis::use_package("dplyr")

# 制定添加到Suggests
usethis::use_package("dplyr", "Suggests")
```

#### 1.3 [`Object documentation`](https://r-pkgs.org/man.html)

添加 `roxygen` 注释到 `.R` 文件，`Roxygen2` 会动态检查需要提供文档的对象，自动生成 `.Rd`文档模版，同时管理 `NAMESPACE` 和 `ESCRIPTION`（中的 `Collate` 域）。
```
devtools::document()
# devtools::document()实际是调用roxygen2::roxygenise()执行操作
```

函数文档 `utils.R`

```
# 函数的输入或参数
#' @param name description

# 导出函数
#' @export
#' @rdname fun_name.rd

# 示例
#' @examples
#' \dontrun{
#' some_fun()
#' }

# 函数返回值
#' @return description


```



### 2.常用命令

终端命令
```
# 创建R包
R CMD BUILD
# 安装R包
R CMD INSTALL
```
r console command
```
# 创建包
devtools::build()

# 利用 README.Rmd 创建 README.md
devtools::build_readme()

# 自动检查
devtools::check()

# source R/ 目录下的所有文件
devtools::load_all()

# 修改全局 options() 或图形 par(), 并在退出时恢复
old <- options(stringsAsFactors = FALSE)
on.exit(options(old), add = TRUE)

old_dir <- setwd(tempdir())
on.exit(setwd(old_dir), add = TRUE)

