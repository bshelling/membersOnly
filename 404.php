<?php
/**
 * The template for displaying 404 pages (not found)
 *
 * @link https://codex.wordpress.org/Creating_an_Error_404_Page
 *
 * @package _s
 */



$context = Timber::context();
$context['post'] = new Timber\Post();
Timber::render('404/index.twig',$context);


