# 项目文档与调用图的自动生成

## 步骤

    1. 将`autodoc.sh`和`Doxyfile`复制到项目的根目录下
    2. 执行`$ ./autodoc.sh`
    3. 打开`./doc.html`，即可检视生成的文档和调用图

## 注意事项

    1. 生成文档和调用图时，会产生众多资源文件，集中于目录`./tmp/Doxygen`之中，这些资源文件不应该提交到git仓库，故`./autodoc.sh`会自动将该目录加入`.gitignore`，自动屏蔽这些资源文件
    2. `doc.html`是软链接，指向`./doxydoc/`内的某个文件，故该链接同样不应该提交到git仓库，故同样被脚本自动屏蔽
    3. `autodoc.sh`和`Doxyfile`是会被提交到git仓库的，故本仓库的这两个文件更新后，请及时拉取更新内容并覆盖到项目中，更新项目内的`autodoc.sh`和`Doxyfile`
    4. 每次初次克隆或者改动代码后，都应该重新执行`$ ./autodoc.sh`
