<?php
/**
 * The template for displaying archive pages
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package _s
 */


		if ( have_posts() ) : ?>


$context = Timber::context();
$context['results'] = Timber::get_posts();
Timber::render('archive/index.twig',$context);
		


<<<<<<< HEAD
=======
			endwhile;

			the_posts_navigation();

		else :

			get_template_part( 'template-parts/content', 'none' );

		endif;
		?>


>>>>>>> development

