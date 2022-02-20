<?php

/**
 * Registered Navigation areas
 */

add_filter('timber/context','add_to_context');


function add_to_context($context){

    $context['footerMenu'] = new \Timber\Menu('footer-nav');

    return $context;
}