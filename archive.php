<?php
/**
 * The template for displaying archive pages
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package _s
 */




$context = Timber::context();
$context['results'] = Timber::get_posts();
Timber::render('search/index.twig',$context);
		
