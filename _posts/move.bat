@echo off
setlocal

rem 设置目标文件夹路径
set "target_dir=..\assets\blog"

rem 遍历当前目录下的所有子文件夹及其子文件夹的子文件夹
for /r %%A in (*) do (
    rem 遍历当前子文件夹中的所有 png 文件
    for %%B in ("%%A\*.png") do (
        rem 获取相对路径
        set "rel_path=%%~pA"
        rem 创建目标文件夹（如果不存在）
        mkdir "%target_dir%\%rel_path%" 2>nul
        rem 复制 png 文件到目标文件夹中
        copy "%%B" "%target_dir%\%rel_path%"
    )
)

echo 操作完成！
pause