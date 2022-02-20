<?php
/**
 * The template for displaying search results pages
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#search-result
 *
 * @package _s
 */



$context = Timber::context();
$context['results'] = Timber::get_posts();
Timber::render('archive/index.twig',$context);

