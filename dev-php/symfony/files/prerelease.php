<?php

/*
 * This file is part of the symfony package.
 * (c) 2004-2007 Fabien Potencier <fabien.potencier@symfony-project.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * Release script.
 *
 * Usage: php data/bin/release.php 1.3.0 stable
 *
 * @package    symfony
 * @author     Fabien Potencier <fabien.potencier@symfony-project.com>
 * @version    SVN: $Id: release.php 24079 2009-11-17 07:59:41Z Kris.Wallsmith $
 */
require_once(dirname(__FILE__).'/../../lib/exception/sfException.class.php');
require_once(dirname(__FILE__).'/../../lib/task/sfFilesystem.class.php');
require_once(dirname(__FILE__).'/../../lib/util/sfFinder.class.php');
require_once(dirname(__FILE__).'/../../lib/vendor/lime/lime.php');

if (@date_default_timezone_get() == 'UTC' and !ini_get('date.timezone'))
{
  date_default_timezone_set('Europe/Paris');
}

if (!isset($argv[1]))
{
  throw new Exception('You must provide version prefix.');
}

$version = $argv[1];
$stability = 'stable';

$filesystem = new sfFilesystem();

print sprintf("Releasing symfony version \"%s\".\n", $version);

if (is_file('package.xml'))
{
  $filesystem->remove(getcwd().DIRECTORY_SEPARATOR.'package.xml');
}

$filesystem->copy(getcwd().'/package.xml.tmpl', getcwd().'/package.xml');

// add class files
$finder = sfFinder::type('file')->relative();
$xml_classes = '';
$dirs = array('lib' => 'php', 'data' => 'data');
foreach ($dirs as $dir => $role)
{
  $class_files = $finder->in($dir);
  foreach ($class_files as $file)
  {
    $xml_classes .= '<file role="'.$role.'" baseinstalldir="symfony" install-as="'.$file.'" name="'.$dir.'/'.$file.'" />'."\n";
  }
}

// replace tokens
$filesystem->replaceTokens(getcwd().DIRECTORY_SEPARATOR.'package.xml', '##', '##', array(
  'SYMFONY_VERSION' => $version,
  'CURRENT_DATE'    => date('Y-m-d'),
  'CLASS_FILES'     => $xml_classes,
  'STABILITY'       => $stability,
));
