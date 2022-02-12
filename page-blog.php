<?php
/**
 * The template for displaying all single posts
 *
 * Template Name: Blog Categor Page
 *
 */


   $context = Timber::context();
   $context['page'] = new Timber\Post();
   Timber::render('page/blog-category.twig',$context);
