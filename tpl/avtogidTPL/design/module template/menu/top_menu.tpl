<ul class="nav navbar-nav dropdown-container">
    {foreach $categories as $cat}
        <li>
            {if $cat->parent_id==0 and $cat->id>0}
                {if count($cat->children)>0}
                    <a class="colorize-menu dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown" href='#'>[[{$cat->extra_parameters.name}]]</a>
                    <ul class="dropdown-menu dropdown-static-height">
                        <li>
                            <a href='{page_path id='browse'}{$cat->extra_parameters.name|replace:' ':'+'}?sorting_fields[activation_date]=DESC'>[[All]]</a>
                        </li>
                        {foreach $cat->children as $kitten}
                            <li>
                                <a href='{page_path id='browse'}{$cat->extra_parameters.name|replace:' ':'+'}/{$kitten->extra_parameters.name|replace:' ':'+'}?sorting_fields[activation_date]=DESC'>[[{$kitten->extra_parameters.name}]]</a>
                            </li>
                        {/foreach}
                    </ul>
                {else}
                    <a href='{page_path id='browse'}{$cat->extra_parameters.name|replace:' ':'+'}'>[[{$cat->extra_parameters.name}]]</a>
                {/if}
            {/if}
        </li>
    {/foreach}
    <li><a class="colorize-menu" href='{page_path id='users_search'}'>[[Sellers]]</a></li>
    <li><a class="colorize-menu" href='{page_path id='salons'}'>[[Salons]]</a></li>
    <li>
        {if count($news_categories)>1000}
            <a class="colorize-menu dropdown-toggle" role="button" aria-expanded="false" data-toggle="dropdown" href='#'>[[Articles]]</a>
            <ul class="dropdown-menu dropdown-static-height">
                {foreach $news_categories as $news_cat}
                    <li><a href="{page_path id='publications'}{$news_cat.id}">[[{$news_cat.title|escape}]]</a></li>
                {/foreach}
            </ul>
        {else}
            <!--            <a class="colorize-menu" href='{page_path id='publications'}'>[[Articles]]</a> -->
            <a class="colorize-menu" href='http://news.avtogid.kg'>[[Articles]]</a>
        {/if}
    </li>
</ul>
<ul class="nav navbar-nav navbar-right hidden-xs">
    <li><a class="addListing" href="{page_path id='listing_add'}">[[Add Listing]]</a></li>
</ul>
<script type="text/javascript">
    $(document).ready(function() {
        $('.dropdown-toggle, .dropdown-menu').mouseover(function() {
            $('.dropdown-container .opened-with-hover').each(function(index, element) {
                $(element).removeClass('open').removeClass('opened-with-hover');
            });
            if(!$(this).parents('li').first().hasClass('open')) {
                $(this).parents('li').first().addClass('open opened-with-hover');
                $('.dropdown-container .open').each(function(index, element) {
                    if(!$(element).hasClass('opened-with-hover')) {
                        $(element).removeClass('open');
                        $(element).find('.dropdown-toggle').blur();
                    }
                });
            }
        }).mouseout(function(e) {
            if(!$(e.relatedTarget).hasClass('dropdown-toggle') && !$(e.relatedTarget).hasClass('dropdown-menu')) {
                $('.dropdown-container .opened-with-hover').each(function(index, element) {
                    $(element).removeClass('opened-with-hover').removeClass('open');
                });
            }
        });
        $('.dropdown-toggle').click(function() {
            if($(this).parents('li').hasClass('opened-with-hover')) {
                $(this).parents('li').removeClass('opened-with-hover').addClass('open');
                return false;
            } else {
                $('.dropdown-container .open').each(function(index, element) {
                    $(element).removeClass('opened-with-hover').removeClass('open');
                });
                $(this).parents('li').addClass('open');
            }
        });
    });
</script>