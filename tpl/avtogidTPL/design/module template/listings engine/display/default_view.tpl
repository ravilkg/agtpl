{extension_point name='modules\main\apps\FrontEnd\IListingDisplayAdditionDisplayer'}

{title}{$listing|cat:""|strip_tags:false}, [[$listing.type.caption:raw]]{/title}
{keywords} {$listing|cat:""|strip_tags:false}, [[$listing.type.caption:raw]]{/keywords}
{description}{$listing|cat:""|strip_tags:false}, [[$listing.type.caption:raw]]{/description}
{include file="category_templates/display/open_graph.tpl"}
<div class="listing-details">
    <ul class="breadcrumb no-padding-left">
        {strip}
            <li><a href="{$GLOBALS.site_url}/browse">[[Categories]]</a></li>

            {foreach from=$browse_navigation_elements item=element name="nav_elements"}
                {*{title}{tr metadata=$element.metadata mode="raw"}{$element.caption}{/tr}{/title}*}
                {*{keywords}{tr metadata=$element.metadata mode="raw"}{$element.caption}{/tr}{/keywords}*}
                {*{description}{tr metadata=$element.metadata mode="raw"}{$element.caption}{/tr}{/description}*}


                {if $smarty.foreach.nav_elements.last && !isset($REQUEST.view_all)}
                    <li class="active">{tr metadata=$element.metadata}{$element.caption}{/tr}</li>
                {else}
                    <li><a href="{$GLOBALS.site_url}{$element.uri}">{tr metadata=$element.metadata}{$element.caption}{/tr}</a></li>
                {/if}
            {/foreach}
        {/strip}
    </ul>
    <div class="row">
        <div class="col-sm-8">
            <h1>
                {if $listing.Sold.exists && $listing.Sold.isTrue}
                    <span class="fieldValue fieldValueSold">[[SOLD]]!</span>
                {elseif $listing.urgent.exists && $listing.urgent.isTrue}
                    <div class="fieldValue fieldValueSold featured-urgent">[[Urgent]]</div>
                {/if}
                {$listing}
                {if ($listing.Price.exists || $listing.Rent.exists) && (!empty($listing.Price.value) || !empty($listing.Rent.value))}
                    {strip}
                        <span class="orange fieldValue fieldValuePrice money">
                            <span class="currencySign">{$GLOBALS.custom_settings.listing_currency}</span>
                            {if $listing.Price.exists}
                                [[$listing.Price]]
                            {elseif $listing.Rent.exists}
                                [[$listing.Rent]]
                            {/if}
                        </span>
                    {/strip}
                {/if}
            </h1>
        </div>
        <div class="col-sm-4">
            <div class="pull-right">
                {include file="category_templates/display/listing_details_search_controls.tpl" listing=$listing}
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-8 col-md-7 col-sm-6 listing-info">

            {display_success_messages}
            {if $messages}{include file="message.tpl"}{/if}

            {if $listing.pictures.numberOfItems > 0}
                {include file="listing_images.tpl" listing=$listing}
            {/if}

            <ul class="list-inline">
                {if $listing.pictures.numberOfItems > 0}
                    <li>
                        {module name="listing_feature_slideshow" function="display_slideshow" listing=$listing}
                    </li>
                {/if}
            </ul>
            {include file='banners^gas_listing_inline.tpl'}
            {if $listing.Video.uploaded}
                {include file="video_player.tpl"}
            {/if}
            {capture assign="yt_video"}
                {module name="listing_feature_youtube" function="display_youtube" listing=$listing listing=$listing width="380px" height="300px"}
            {/capture}
            {if $yt_video|count_characters > 1}
                {$yt_video}
            {/if}

            <div class="panel-group">
                {foreach $magicFields->excludeSystemFields()->filterByType('text')->filterById('Description') as $fieldId => $formField}
                    {if $listing.$fieldId.isNotEmpty}
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <a data-toggle="collapse" href="#{$formField.caption|replace:' ':''}">
                                        [[$formField.caption]] <span class="pull-right"><span data-icon-down="glyphicon-chevron-up" data-icon-up="glyphicon-chevron-down" class="glyphicon glyphicon-chevron-up"></span></span>
                                    </a>
                                </h3>
                            </div>
                            <div id="{$formField.caption|replace:' ':''}" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="fieldValue">{$listing.$fieldId}</div>
                                </div>
                            </div>
                        </div>
                    {/if}
                {/foreach}

                {foreach $magicFields->excludeSystemFields()->filterByType('multilist') as $fieldId => $formField}
                    {if $listing.$fieldId.isNotEmpty}
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <a data-toggle="collapse" href="#{$formField.caption|replace:' ':''}">
                                        [[$formField.caption]] <span class="pull-right"><span data-icon-down="glyphicon-chevron-up" data-icon-up="glyphicon-chevron-down" class="glyphicon glyphicon-chevron-up"></span></span>
                                    </a>
                                </h3>
                            </div>
                            <div id="{$formField.caption|replace:' ':''}" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <div class="fieldValue">{$listing.$fieldId}</div>
                                </div>
                            </div>
                        </div>
                    {/if}
                {/foreach}
                {foreach $magicFields->filterByType('calendar')->filterById([]) as $fieldId => $formField}
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                <a data-toggle="collapse" class="collapsed" href="#{$formField.caption|replace:' ':''}">
                                    [[$formField.caption]] <span class="pull-right"><span data-icon-down="glyphicon-chevron-up" data-icon-up="glyphicon-chevron-down" class="glyphicon glyphicon-chevron-up"></span></span>
                                </a>
                            </h3>
                        </div>
                        <div id="{$formField.caption|replace:' ':''}" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="fieldValue">
                                    {display property=$fieldId}
                                </div>
                            </div>
                        </div>
                    </div>
                {/foreach}

            </div>

            {assign var='current_uri' value=$GLOBALS.current_page_uri|cat:'?'|cat:$smarty.server.QUERY_STRING}
            {assign var='current_uri' value=$current_uri|urlencode}
            {module name="listing_comments" function="display_listing_details_comments" listing=$listing returnBackUri=$current_uri}
            {module name="facebook_comments" function="display_comments" url="{page_url id='listing'}"|cat:$listing.id}
            {include file='banners^gas_listing_comment.tpl'}
        </div>

        <div class="col-lg-4 col-md-5 col-sm-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title">
                        <a data-toggle="collapse" href="#summary">
                            [[Summary]] <span class="pull-right"><span data-icon-down="glyphicon-chevron-up" data-icon-up="glyphicon-chevron-down" class="glyphicon glyphicon-chevron-up"></span></span>
                        </a>
                    </h2>
                </div>
                <div id="summary" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                                <dl class="dl-horizontal">
                                    {assign var=contactDataFields value=['Name', 'PhoneNumber', 'phone2', 'phone3', 'Email', 'Address']}
                                    {foreach $magicFields->excludeSystemFields()->excludeByType('text', 'rating', 'video', 'calendar', 'multilist')->excludeById('SizeInPaper', 'IsInPaper', 'urgent', 'paymentId', 'ups', 'status', 'firstApprove', 'id', 'fromPaper', 'RideDistanceUnit', 'AllowComments', 'PostInTheNewspaper', 'OnNIssues') as $fieldId => $formField}
                                        {if $listing.$fieldId.isNotEmpty}
                                            <dt class="fieldCaption {$fieldId} {if in_array($fieldId, $contactDataFields)}contact-data{/if}">[[$formField.caption]]</dt>
                                            <dd class="fieldValue {$fieldId} {if in_array($fieldId, $contactDataFields)}contact-data{/if}">
                                                {display property=$fieldId}
                                                {if $fieldId == 'RideDistance'}{display property='RideDistanceUnit'}{/if}&nbsp;</dd>
                                        {/if}
                                    {/foreach}
                                    <dt class="fieldCaption views">[[FormFieldCaptions!Listing Views]]</dt>
                                    <dd class="fieldValue views">[[$listing.views]]&nbsp;</dd>

                                    <dt class="fieldCaption views">[[FormFieldCaptions!Date Posted]]</dt>
                                    <dd class="fieldValue views">[[$listing.activation_date]]&nbsp;</dd>
                                </dl>
                            </div>
                        </div>
                        <span id="show-listing-contact-data" data-phrase-show="[[Show phone]]" data-phrase-hide="[[Hide phone]]" class="btn btn-primary">[[Show phone]]</span>
                    </div>
                </div>
            </div>
            {include file='banners^gas_listing_right.tpl'}
            {assign var='carAge' value='Y'|date - $listing.Year.value}
            {if $listing.category_sid.value.Category eq 'Auto' and $GLOBALS.settings.credit_bank_max_car_age gt $carAge}
                {module name='custom_credit_calculator' function='credit_calculator_block' price=$listing.AutoPrice.value}
            {/if}
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <a data-toggle="collapse" href="#ManageSearch">
                            <span data-icon-down="glyphicon-collapse-down" data-icon-up="glyphicon-expand" class="glyphicon glyphicon-expand"></span> [[Manage Search]]
                        </a>
                    </h3>
                </div>
                {include file="classifieds^search_controls.tpl"}
            </div>

            {include file="category_templates/display/listing_details_listing_controls.tpl"}
            <div class="panel panel-default">
                <div class="panel-body">
                    {include file="author_info.tpl" listing=$listing}
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('.collapse')
                    .on('show.bs.collapse', function () {
                        $('.glyphicon', $(this).parent())
                                .addClass($('.glyphicon', $(this).parent()).data('icon-down'))
                                .removeClass($('.glyphicon', $(this).parent()).data('icon-up'));
                    })
                    .on('hide.bs.collapse', function () {
                        $('.glyphicon', $(this).parent())
                                .addClass($('.glyphicon', $(this).parent()).data('icon-up'))
                                .removeClass($('.glyphicon', $(this).parent()).data('icon-down'));
                    })
        });
        $(document).ready(function() {
            $('#show-listing-contact-data').click(function() {
                if($('.contact-data:visible').length > 0) {
                    $('.contact-data').hide();
                    $(this).text($(this).data('phrase-show'));
                } else {
                    $('.contact-data').show();
                    $(this).text($(this).data('phrase-hide'));
                }
            });
        });
    </script>
</div>