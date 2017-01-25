{extends 'homepage_main_content_base.tpl'}

{block name="listing_feature"}
    {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime='1D' name="classifieds" function="search_form" form_template="quick_search.tpl" category_id="auto" do_not_modify_meta_data=true}
    {*{module name="listing_feature_featured" function="featured_listings" featured_listings_template="featured_listings.tpl" number_of_rows="1" number_of_cols="9" do_not_modify_meta_data=true}*}
{/block}

{block name="browse_block"}
    <div class="browse-block">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <ul class="nav nav-tabs my-tabs1" role="tablist">
                        <li class="active">
                            <a href="#BrowseCars" role="tab" data-toggle="tab">[[Auto]]</a>
                        </li>
                        <li>
                            <a href="#BrowseParts" role="tab" data-toggle="tab">[[Parts]]</a>
                        </li>
                        <li>
                            <a href="#BrowseServices" role="tab" data-toggle="tab">[[Services]]</a>
                        </li>
                        <li>
                            <a href="#BrowseBuy" role="tab" data-toggle="tab">[[Buying]]</a>
                        </li>
                    </ul>
                    <div class="tab-content lists listing-list">
                        <div class="tab-pane fade in active" id="BrowseCars">
                            {*{module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime='1D' name="classifieds" function="browse_by_categories" category_id="Auto" number_of_rows="9" number_of_cols="1" browse_template='browse_by_make_model.tpl' do_not_modify_meta_data=true}*}
                            {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime=60 name="recent_listings" function="display_recent_listings" number_of_rows="9" number_of_cols="1" category_id="Auto" do_not_modify_meta_data=true}
                        </div>
                        <div class="tab-pane fade" id="BrowseParts">
                            {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime=60 name="recent_listings" function="display_recent_listings" number_of_rows="9" number_of_cols="1" category_id="Parts" do_not_modify_meta_data=true}
                            {*{module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime='1D' name="classifieds" function="browse" category_id="Car" fields="State" number_of_cols="4" browse_template='browse_by_state.tpl'}*}
                        </div>
                        <div class="tab-pane fade" id="BrowseServices">
                            {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime=60 name="recent_listings" function="display_recent_listings" number_of_rows="9" number_of_cols="1" category_id="Services" do_not_modify_meta_data=true}
                        </div>
                        <div class="tab-pane fade" id="BrowseBuy">
                            {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime=60 name="recent_listings" function="display_recent_listings" number_of_rows="9" number_of_cols="1" category_id="Buy" do_not_modify_meta_data=true}
                        </div>
                        <div class="showMoreBtn"><a href="/browse/?view_all&sorting_fields[activation_date]=DESC">[[ShowAll]]</a></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="tab-content homeRightBlock">
                        <div class="tab-pane  fade in active">
                            {module cached=$GLOBALS.settings.cache_blocks_main_page cacheLifeTime='1D' name="publications" function="show_publications" passed_parameters_via_uri="" category_id="News" number_of_publications="4" publications_template="print_news_box_articles.tpl"}
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane  fade in active">
                            <div id="Facebook" class="facebook">
                                <div id="fb-root"></div>
                                <script>
                                    (function (d, s, id) {
                                        var js, fjs = d.getElementsByTagName(s)[0];
                                        if (d.getElementById(id)) return;
                                        js = d.createElement(s);
                                        js.id = id;
                                        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=195402287233378";
                                        fjs.parentNode.insertBefore(js, fjs);
                                    }(document, 'script', 'facebook-jssdk'));
                                </script>
                                <div class="fb-like-box" data-href="https://www.facebook.com/avtogid.kg"
                                     data-width="600"
                                     data-height="250" data-show-faces="true" data-stream="false"
                                     data-show-border="false"
                                     data-header="false"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content homeRightBlock">
                        <div class="tab-pane fade in active marketBan2">
                            {module name='banners' function='show_banner_group' group_name='MainPageRight'}
                        </div>
                    </div>
                  	<div class="tab-content homeRightBlock">
                  		<div class="tab-pane fade in active">
                        	{include file='banners^gas_main_right.tpl'}
                    	</div>
                	</div>
              	</div>
            </div>
            {include file="main^page_parts/go_top.tpl"}
        </div>
    </div>
{/block}

{block name="recent_listings"}

{/block}