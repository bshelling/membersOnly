<?php
/**
 * The template for displaying all single posts
 *
 * Template Name: Blog Categor Page
 *
 */


   $context = Timber::context();
   $context['page'] = new Timber\Post();

   $context['discoverPosts'] = Timber::get_posts([
    'category_name' => 'discover',
    'posts_per_page' => 3
   ]);

   $context['envPosts'] = Timber::get_posts([
    'category_name' => 'environment',
    'posts_per_page' => 3
   ]);


   $context['inspPosts'] = Timber::get_posts([
    'category_name' => 'inspiration',
    'posts_per_page' => 3
   ]);


   $context['mindPosts'] = Timber::get_posts([
    'category_name' => 'mindset',
    'posts_per_page' => 3
   ]);


   $context['processPosts'] = Timber::get_posts([
    'category_name' => 'process',
    'posts_per_page' => 3
   ]);




   Timber::render('page/blog-category.twig',$context);
