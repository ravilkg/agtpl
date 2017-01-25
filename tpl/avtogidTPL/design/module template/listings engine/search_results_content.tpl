{extension_point name='modules\main\apps\FrontEnd\ISearchResultsAdditionDisplayer' listingSearchID = $listing_search.id}
<script type="text/javascript" src="{url file='custom_credit_calculator^creditCalculator.js'}"></script>
{include file="custom_credit_calculator^credit_calculator_modal.tpl"}
<div class="listingSearchResultsPage">
	{if $listing_search.total_found > 0}
		{capture assign="restore_url"}
			{$GLOBALS.site_url}{$listing_search.search_results_uri}?action=restore&amp;searchId={$listing_search.id}
		{/capture}
		{include file="search_result_header.tpl" restore_url=$restore_url}
		<div class="searchResults">
			{foreach from=$listings item=listing name=listings}
                <div class="searchResultItemWrapper{if $listing@last} last{/if}">
					{display_listing listing=$listing listingControlsTemplate="search_result_listing_controls.tpl" listing_search=$listing_search}
                </div>
				{if $listing@iteration eq 3 or (count($listings) < 3 and $listing@last)}
					<div class="searchResultItemWrapper">
						{include file='banners^listing_list_banner.tpl'}
					</div>
				{/if}
          		{if $listing@iteration eq 6}
        	        {$iterationCounter = $iterationCounter + 1}
                    <div class="searchResultItemWrapper">
						{include file='banners^gas_listing_main_7.tpl'}
					</div>
                {/if}
             	{if $listing@last}
                	<div class="searchResultItemWrapper">
                		{include file='banners^gas_listing_main_last.tpl'}
                	</div>
                {/if}
			{/foreach}
		</div>
		{include file="page_selector.tpl" current_page=$listing_search.current_page pages_number=$listing_search.pages_number url=$restore_url}
	{else}
        {if !is_null($listing_search.search_form_uri)}
            {assign var=link value="{$GLOBALS.site_url}{$listing_search.search_form_uri}?action=restore&amp;searchId={$listing_search.id}"}
            <p class="error">[[There are no listings available that match your search criteria. Please try to <a href="$link">broaden your search criteria</a>.]]</p>
            {else}
            <p class="error">[[There are no listings available that match your search criteria. Please try to broaden your search criteria.]]</p>
        {/if}
	{/if}
</div>
<script type="text/javascript">
	var listingsInComparisonCounter = {$listingsCountInComparison};
</script>