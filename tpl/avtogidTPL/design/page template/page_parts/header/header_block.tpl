{require component="jquery" file="jquery.js"}
{require component="twitter-bootstrap" file="css/bootstrap.min.css"}
{require component="twitter-bootstrap" file="js/bootstrap.min.js"}
{include file="miscellaneous^bootstrap_button_noconflict.tpl"}
<script data-skip-moving="true">
    (function(w,d,u,b){
        s=d.createElement('script');r=(Date.now()/1000|0);s.async=1;s.src=u+'?'+r;
        h=d.getElementsByTagName('script')[0];h.parentNode.insertBefore(s,h);
    })(window,document,'https://cdn.bitrix24.ru/b989819/crm/site_button/loader_2_yph8h6.js');
</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-56c2b6646531cb92" async="async"></script>

<header class="login-bg navbar-fixed-top">
    <nav class="navbar navbar-inverse navbar-fixed-top colorize-menu menu-green hidden-md hidden-sm hidden-lg" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="mobile-menu-logo menu-logo-container" href="{$GLOBALS.site_url}">
                    <span class="menu-logo-helper"></span>
                    <img src="{GetLogoUrl type='mobile'}" width="80" class="menu-logo">
                </a>
                {if $GLOBALS.current_user.logged_in}
                    {extension_point name="modules\menu\apps\FrontEnd\ITopMenuItem" wrapperStartTag="<span class=\"col-xs-offset-2 hidden-sm hidden-md hidden-lg basketTopMenuItemMobile\">" wrapperEndTag="</span>"}
                {/if}
            </div>

            <div class="collapse navbar-collapse" id="main-menu">
                {module name="menu" function="top_menu"}
                {module name="users" function="user_menu_block_menu"}
            </div>
        </div>
    </nav>
    <div class="container ">
        <div class="row">
            <div class="col-md-12 logo-right">
                <div class="pull-right lang-selector hidden-xs">
                    {module name="users" function="user_menu_block"}
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-inverse colorize-menu menu-green hidden-xs" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand colorize-menu menu-logo-container" href="{$GLOBALS.site_url}">
                    <span class="menu-logo-helper"></span>
                    <img src="{GetLogoUrl}" width="80" class="menu-logo">
                </a>
                {if $GLOBALS.current_user.logged_in}
                    {extension_point name="modules\menu\apps\FrontEnd\ITopMenuItem" wrapperStartTag="<span class=\"col-xs-offset-2 hidden-sm hidden-md hidden-lg basketTopMenuItemMobile\">" wrapperEndTag="</span>"}
                {/if}
            </div>
            <div class="collapse navbar-collapse" id="main-menu">
                {module name="menu" function="top_menu"}
                {module name="users" function="user_menu_block_menu"}
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="globalErrorWrapper margin-top-66">
        {extension_point name='modules\main\apps\FrontEnd\IGlobalErrorDisplayer' HTTP_REFERER=$GLOBALS.site_url|cat:$GLOBALS.current_page_uri}
    </div>
    {module name="listing_feature_featured" function="featured_listings" featured_listings_template="featured_listings.tpl" number_of_rows="1" number_of_cols="8" do_not_modify_meta_data=true}
    <div class="row hidden-md hidden-lg hidden-sm">
        <div class=" col-xs-12 col-sm-12">
            <div class="newAd"><a href="/listing/add/">[[Add Listing]]</a></div>
        </div>
    </div>
</div>