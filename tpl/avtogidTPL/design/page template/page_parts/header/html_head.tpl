<head>
    <meta name="keywords" content="{$KEYWORDS}"/>
    <meta name="description" content="{$DESCRIPTION}"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="yandex-verification" content="f593e789eaaf138d" />
    {$META_TAGS}
    <title>{$GLOBALS.custom_settings.site_name}{if $GLOBALS.custom_settings.site_name ne "" and $TITLE ne ""}: {/if}{$TITLE}</title>
    <!-- #EXTERNAL_COMPONENTS_PLACEHOLDER# -->
    {if $GLOBALS.site_url == 'https://www.avtogid.kg'}
    {literal}
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({
                google_ad_client: "ca-pub-3338505015690985",
                enable_page_level_ads: true
            });
        </script>
    {/literal}
    {/if}
    <script src="{$GLOBALS.site_url}/vendor/jquery-touch-punch/jquery-touch-punch.js"></script>
    {if $GLOBALS.current_page_uri == '/system/payment/payment_page/'}
        <script src="https://acquiring.mobilnik.kg/static/js/acquiring.js"></script>
        <script type='text/javascript'>
            function SendPayment(jwt_value,key) {
                mobilnik.buy({
                    jwt: jwt_value,
                    key: key,
                    success: function (e) {
                        console.log(e);
                        document.location = jQuery('[name="invoiceSuccessURL"]').val();
                    },
                    failure: function (e) {
                        console.log(e);
                        alert('Не удалось провести платёж. Попробуйте ещё раз.');
                    }
                });
                return false;
            }

            jQuery(function () {
                jQuery('.paymentGateways form').on('submit', function () {
                    var jwtValue = jQuery(this).find('[name="jwtToken"]').val();
                    var jwtKey = jQuery(this).find('[name="jwtKey"]').val();
                    SendPayment(jwtValue,jwtKey);
                    return false;
                });
            });
        </script>
    {/if}
    {includeDesignFiles}
    {includeFavicon}
    <script type="text/javascript" src="{url file='main^bookmarks.js'}"></script>
    {if $GLOBALS.settings.i18n_sort_translated_list_and_tree_values}
        {include file="I18N^sort_select_options_js.tpl"}
    {/if}
    {i18n->getCurrentLanguage assign="currentLanguage"}
    {module name='main' function='display_html_header_tag_content'}
    {if $GLOBALS.site_url == 'http://avtogid.ltestl.com'}
    {literal}
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-86718221-2', 'auto');
            ga('send', 'pageview');

        </script>
    {/literal}
    {/if}
    {if $GLOBALS.site_url == 'https://www.avtogid.kg'}
    {literal}
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-86718221-1', 'auto');
            ga('send', 'pageview');

        </script>
    {/literal}
    {literal}
        <!-- Yandex.Metrika counter -->
        <script type="text/javascript">
            (function (d, w, c) {
                (w[c] = w[c] || []).push(function() {
                    try {
                        w.yaCounter41102874 = new Ya.Metrika({
                            id:41102874,
                            clickmap:true,
                            trackLinks:true,
                            accurateTrackBounce:true
                        });
                    } catch(e) { }
                });

                var n = d.getElementsByTagName("script")[0],
                        s = d.createElement("script"),
                        f = function () { n.parentNode.insertBefore(s, n); };
                s.type = "text/javascript";
                s.async = true;
                s.src = "https://mc.yandex.ru/metrika/watch.js";

                if (w.opera == "[object Opera]") {
                    d.addEventListener("DOMContentLoaded", f, false);
                } else { f(); }
            })(document, window, "yandex_metrika_callbacks");
        </script>
        <noscript><div><img src="https://mc.yandex.ru/watch/41102874" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
        <!-- /Yandex.Metrika counter -->
    {/literal}
    {/if}
</head>