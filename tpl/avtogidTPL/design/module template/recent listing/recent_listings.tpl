{require component="owl-carousel" file="assets/owl.carousel.css"}
{require component="owl-carousel" file="assets/owl.theme.default.min.css"}
{require component="jquery" file="jquery.js"}
{require component="owl-carousel" file="owl.carousel.js"}
{if count($hot_listings) > 0}
<div class="recentListings widget gallery-view hidden-lg hidden-md hidden-sm">
    {extension_point name='modules\recent_listings\apps\FrontEnd\IRecentListingsAdditionRenderer'}
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <h2 class="list-category-head">[[HOT 10]]</h2>
        </div>
    </div>
    <div class="row">
        {foreach from=$hot_listings item=listing}
            {capture assign="listingUrl"}{page_path id='listing'}{$listing.id}/{$listing.urlData|replace:' ':'-'|escape:"urlpathinfo"}.html{/capture}
            {include file='classifieds^listing_default_view.tpl'}
            {if $listing@iteration is div by 4}
                <div class="clearfix visible-md visible-lg"></div>
            {/if}
            {if $listing@iteration is div by 2}
                <div class="clearfix visible-sm"></div>
            {/if}
        {/foreach}
    </div>
</div>
{/if}
    {*********************************for block to change for "fresh car*****************************************}
<ul class="nav nav-tabs my-tabs2" role="tablist">
    <li class="active">
        <a href="#Fresh-{$listing_category_id}" role="tab" data-toggle="tab">[[FRESH]]</a>
    </li>
    <li>
        <a href="#Popular-{$listing_category_id}" role="tab" data-toggle="tab">[[POPULAR]]</a>
    </li>
</ul>
<div class="tab-content lists">
    <div class="tab-pane fade in active" id="Fresh-{$listing_category_id}">
        <div class="recentListings widget gallery-view">
            {extension_point name='modules\recent_listings\apps\FrontEnd\IRecentListingsAdditionRenderer'}
            {assign var='iterationCounter' value=1}
            <div class="row">
                {foreach from=$listings item=listing}
                    {capture assign="listingUrl"}{page_path id='listing'}{$listing.id}/{$listing.urlData|replace:' ':'-'|escape:"urlpathinfo"}.html{/capture}
                    {include file='classifieds^listing_default_view.tpl'}
                    {if $listing@iteration eq 3 or (count($listings) < 3 and $listing@last)}
                        {$iterationCounter = $iterationCounter + 1}
                        <div class="col-sm-12 col-md-12 listing-item">
                            {include file='banners^listing_list_banner.tpl'}
                        </div>
                    {/if}
                    {if $listing@iteration eq 6}
                        {$iterationCounter = $iterationCounter + 1}
                            <div class="col-sm-12 col-md-12 listing-item">
                                {include file='banners^gas_listing_main_7.tpl'}
                            </div>
                    {/if}
              		{if $listing@last}
                            <div class="col-sm-12 col-md-12 listing-item">
                                {include file='banners^gas_listing_main_last.tpl'}
                            </div>
                    {/if}
                    {if $iterationCounter is div by 4}
                        <div class="clearfix visible-md visible-lg"></div>
                    {/if}
                    {if $iterationCounter is div by 2}
                        <div class="clearfix visible-sm"></div>
                    {/if}
                    {$iterationCounter = $iterationCounter + 1}
                {/foreach}
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="Popular-{$listing_category_id}">
        {module name="popular_listings" function="display_popular_listings" number_of_rows="10" number_of_cols="1"}
    </div>
</div>
    {*****************************end block to change **********************}