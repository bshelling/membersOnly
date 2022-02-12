<?php
/**
 * The template for displaying all single posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/#single-post
 *
 * @package _s
 */


   $context = Timber::context();
   $context['page'] = new Timber\Post();
   Timber::render('page/index.twig',$context);
