<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db1' );

/** Database username */
define( 'DB_USER', 'user' );

/** Database password */
define( 'DB_PASSWORD', 'pwd' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '|jC^<Ri{vEW/nc%0#@6aZ<Y%{gQ,g,Oa:x^KH&k6+3d0ay$K ;3KZQ,y&s_g+H%-' );
define( 'SECURE_AUTH_KEY',  '|68vu5VY<?e*ZrB3T^C_n<SWJ(*q9sMNcF<sM.LSA*SwJ&z:[WJ`Q|$ZI!#8nI,?' );
define( 'LOGGED_IN_KEY',    'Ax6;Rx[/oNa|yZF#nPi3,P= ]W0(u$ewh6^-*?(o`3gi ^rn5.`LPRGp(/BlT8[=' );
define( 'NONCE_KEY',        'i=Gg{9~qTA3dy`}9gV&)j!4GwsOy<pE7^yxdE/,5 lS0z$Buu@+<`#i~4zX~wz1:' );
define( 'AUTH_SALT',        'Tg#!Xvcpt:0(8Tu*lo_@1IX9WzU1S(L^,Ap#01d+nA~+m?:,rw]:z~TDW/PD5jO>' );
define( 'SECURE_AUTH_SALT', '&@G4OXdUd4#S.X4:v.,&*fU_kJXtbO}_#=Rm`hNVD){ecx-S1ox{4kZ+Ls?ukn0v' );
define( 'LOGGED_IN_SALT',   '/64N1ApYgRRx:E=W-9,cT@SQe+W%4/;[[7NcjCpQM~h1WO)Mp:?=.kp{?R@g2b]o' );
define( 'NONCE_SALT',       '{8IL_y6UkL>To$g.B_5UB39FzSTq?_U[03BS,k$L*K7_[Ltw#!AAmKve}(m^Dl@;' );

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );     
define('WP_CACHE', true);
define( 'WP_REDIS_CONFIG', 'default' );
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
