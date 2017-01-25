{require component="owl-carousel" file="assets/owl.carousel.css"}
{require component="owl-carousel" file="assets/owl.theme.default.min.css"}
{require component="jquery" file="jquery.js"}
{require component="owl-carousel" file="owl.carousel.js"}
{capture assign="listingUrl"}{page_path id='listing'}{$listing.id}/{$listing.urlData|replace:' ':'-'|escape:"urlpathinfo"}.html{/capture}
<div class="slide-item">
    <a href="{$listingUrl}" title='{$listing|strip_tags}'>
        <div class="pull-bottom">
            {if $listing.pictures.numberOfItems > 0}
                {listing_image pictureInfo=$listing.pictures.collection.0 alt="[[Listing #]]"|cat:$listing.id}
            {else}
                <img
                        src="{url file='main^no_image_available_big.png'}"
                        alt="[[No photos:raw]]"
                        class="noImageAvailable"/>
            {/if}
            {if $listing.urgent.exists && $listing.urgent.isTrue}
                <div class="featured-urgent-overlay">[[Urgent]]</div>
            {/if}
            {if $listing.Video.uploaded}
                <div class="featured-video-overlay">[[Video]]</div>
            {/if}
        </div>
        <div class="caption">
            <p>
                {$listing|cat:""|strip_tags:false}<br/>
                {include file="miscellaneous^listing/price.tpl"}
            </p>
        </div>
    </a>
</div>
{include file="miscellaneous^dialog_window.tpl"}