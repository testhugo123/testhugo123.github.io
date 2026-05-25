# 添加彩虹背景
cat - >> themes/hugo-theme-stack/layouts/partials/footer/custom.html <<'EOF'
<!-- layouts/partials/footer/custom.html -->
<script
    src="https://cdn.jsdelivr.net/gh/zhixuan2333/gh-blog@v0.1.0/js/ribbon.min.js"
    integrity="sha384-UEK8ZiP3VgFNP8KnKMKDmd4pAUAOJ59Y2Jo3ED2Z5qKQf6HLHovMxq7Beb9CLPUe"
    crossorigin="anonymous"
    size="300"
    alpha="0.6"
    zindex="-1"
    defer
></script>
EOF

cat - >> themes/hugo-theme-stack/layouts/partials/footer/custom.html <<'EOF'
<!-- layouts/partials/footer/custom.html -->
<script
    src="https://cdn.jsdelivr.net/gh/zhixuan2333/gh-blog@v0.1.0/js/nprogress.min.js"
    integrity="sha384-bHDlAEUFxsRI7JfULv3DTpL2IXbbgn4JHQJibgo5iiXSK6Iu8muwqHANhun74Cqg"
    crossorigin="anonymous"
></script>
<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/gh/zhixuan2333/gh-blog@v0.1.0/css/nprogress.css"
    integrity="sha384-KJyhr2syt5+4M9Pz5dipCvTrtvOmLk/olWVdfhAp858UCa64Ia5GFpTN7+G4BWpE"
    crossorigin="anonymous"
/>
<script>
    NProgress.start();
    document.addEventListener("readystatechange", () => {
        if (document.readyState === "interactive") NProgress.inc(0.8);
        if (document.readyState === "complete") NProgress.done();
    });
</script>
EOF

# 添加网易云短代码
mkdir -p layouts/shortcodes/
cat - > layouts/shortcodes/netease.html <<'EOF'
<iframe
  frameborder="no"
  border="0"
  marginwidth="0"
  marginheight="0"
  width=330 height=86
  src="//music.163.com/outchain/player?type=2&id={{.Get 0}}&auto=0&height=66">
</iframe>
EOF
# 添加文字属性
cat - > layouts/shortcodes/align.html <<'EOF'
<p style="text-align:{{ index .Params 0 }}">{{ index .Params 1 | markdownify }}</p>
EOF
# 插入github仓库
cat - > layouts/shortcodes/github.html <<'EOF'
<div class="github">
    <div class="logo">
        {{ replace $.Site.Data.SVG.repository "icon" "icon github-icon" | safeHTML }}
        <a class="name" href={{ .Get "link" }} target="_blank">{{ .Get "name" }}</a>
    </div>
    <div class="description">{{ .Get "description" }}</div> 
    <div class="language">
        <span class="language-color" style="background-color: {{ .Get "color" }}"></span>
        <span class="language-name">{{ .Get "language" }}</span>
    </div>
</div>
EOF
