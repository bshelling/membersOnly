<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package _s
 */

   global $post;
   $context = Timber::context();
   $context['catArticles'] = Timber::get_posts([
     'posts_per_page' => 3,
     'cat' => get_category($post->ID)->cat_ID
   ]);

   $context['post'] = new Timber\Post();


   Timber::render('post/index.twig',$context);
