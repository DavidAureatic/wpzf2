<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2014 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Application;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;
use Application\Listener\TweetListener;
use Zend\ModuleManager\ModuleManager;

class Module
{
	public function init(ModuleManager $moduleManager)
	{
		$sharedEvents = $moduleManager->getEventManager()->getSharedManager();
		$sharedEvents->attach(__NAMESPACE__, 'dispatch', function($e) {
			// This event will only be fired when an ActionController under the MyModule namespace is dispatched.
			$controller = $e->getTarget();
			$controller->layout('layout/layout');
		}, 100);
	}
	
	
	
    public function onBootstrap(MvcEvent $e)
    {
        $eventManager        = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleRouteListener();
        $moduleRouteListener->attach($eventManager);
        
        /* With a EventManager */
        /*
        $eventManager->attach('sendTweet', function($e) {
        	var_dump($e);
        }, 100);
        */
        
        
        /* With a Shared EventManager */
        	
        $sharedEventManager = $eventManager->getSharedManager();
        /* Where is the listener, metodo */
                
        // This listener will be called ONLY if the sendTweet event is triggered
        // by an event manager that has the Tweet\Service\TweetService identifier !
        $sharedEventManager->attach('Application\Service\TweetService', 'sendTweet', function($e) {
        	var_dump($e);
        }, 100);
        	
        // This listener will be called for all events sendTweet from all event
        // manager that has the identifier Application\Service\ServiceInterface,
        // so potentially a lot
        $sharedEventManager->attach('Application\Service\ServiceInterface', 'sendTweet', function($e) {
        	var_dump($e);
        }, 100);
        
        
        
        
        /* With MVC EVENTS */
//         $eventManager->attach(MvcEvent::EVENT_ROUTE, function($e) {
//         	var_dump("On route");
//         }, 200);
        
//         $eventManager->attach(MvcEvent::EVENT_ROUTE, function($e) {
//         	var_dump("On route 100");
//         }, 100);

//        	$eventManager->attach(MvcEvent::EVENT_BOOTSTRAP, function($e) {
//        		var_dump("On bootstrap");
//        	}, 200);
       	
//        	$eventManager->attach(MvcEvent::EVENT_FINISH, function($e) {
//        		var_dump("On finish");
//        	}, 200);
        	
//        	$eventManager->attach(MvcEvent::EVENT_DISPATCH, function($e) {
//        		var_dump("On dispatch");
//        	}, 200);
       			 

       	/* With a lot of Listeners, don't use closure */
       	$eventManager = $e->getTarget()->getEventManager();
       	$eventManager->attach(new TweetListener());
       		
        	
    }

    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }
}
