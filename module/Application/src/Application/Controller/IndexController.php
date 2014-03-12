<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Service\TweetService;

class IndexController extends AbstractActionController
{
    
	public function indexAction()
    {
//     	$this->layout('layout/backend');
    	
    	
    	// Trigger an event
//     	$this->getEventManager()->trigger('sendTweet', null, array('content' => 'kaka'));
    	
//     	$service = new TweetService();
//     	$service -> sendTweet('kaka');
    	
        return new ViewModel();
    }
    
    
    
    public function loginAction()
    {
    	$this->layout('layout/login');
    	return new ViewModel();
    }
}
