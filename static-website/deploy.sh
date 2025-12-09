#!/bin/bash

# 音元系统 - 静态网站一键部署脚本
# 支持 GitHub Pages、Vercel、Netlify 部署

echo "🚀 音元系统静态网站部署工具"
echo "=================================="

# 检查当前目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误：请在 static-website 目录中运行此脚本"
    exit 1
fi

# 显示部署选项
echo ""
echo "请选择部署平台："
echo "1. GitHub Pages"
echo "2. Vercel" 
echo "3. Netlify"
echo "4. 本地预览"
echo ""

read -p "请输入选项编号 (1-4): " choice

case $choice in
    1)
        echo "🐙 准备部署到 GitHub Pages..."
        echo ""
        echo "部署步骤："
        echo "1. 将整个 static-website 文件夹上传到 GitHub 仓库"
        echo "2. 进入仓库 Settings → Pages"
        echo "3. 选择部署分支（main 或 gh-pages）"
        echo "4. 访问：https://你的用户名.github.io/仓库名"
        echo ""
        echo "📁 需要上传的文件："
        ls -la
        ;;
    2)
        echo "▲ 准备部署到 Vercel..."
        echo ""
        echo "部署步骤："
        echo "1. 将项目上传到 GitHub"
        echo "2. 访问 https://vercel.com"
        echo "3. 导入 GitHub 仓库"
        echo "4. 自动部署完成"
        echo ""
        echo "访问：https://项目名.vercel.app"
        ;;
    3)
        echo "🌐 准备部署到 Netlify..."
        echo ""
        echo "部署步骤："
        echo "1. 将项目上传到 GitHub"
        echo "2. 访问 https://netlify.com"
        echo "3. 拖拽文件夹或连接仓库"
        echo "4. 获得专属域名"
        ;;
    4)
        echo "🖥️  启动本地预览服务器..."
        echo ""
        
        # 检查 Python 版本
        if command -v python3 &> /dev/null; then
            echo "使用 Python 3 启动服务器..."
            python3 -m http.server 8000
        elif command -v python &> /dev/null; then
            echo "使用 Python 启动服务器..."
            python -m http.server 8000
        else
            echo "❌ 未找到 Python，请安装 Python 3.x"
        fi
        ;;
    *)
        echo "❌ 无效选项，请输入 1-4"
        exit 1
        ;;
esac

echo ""
echo "✅ 部署指南完成！"
echo "📖 详细说明请查看 deploy-guide.html"