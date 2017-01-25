{assign var="categoryTitle" value=$category.title}
<div class="newsBlock">
    <h2>[[$categoryTitle]]</h2>
    {literal}
        <script type='text/javascript' charset='utf-8' src='//scripts.hashemian.com/jss/feed.js?print=yes&numlinks=5&summarylen=500&seedate=no&popwin=no&url=http:%2F%2Fnews.avtogid.kg%2Ffeed'></script>
    {/literal}
    <div class="showMoreBtn"><a href="//news.avtogid.kg">[[Archive]]</a></div>
</div>