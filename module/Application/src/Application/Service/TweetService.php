<?php
namespace Application\Service;

use Zend\EventManager\EventManagerAwareInterface;
use Zend\EventManager\EventManagerInterface;
use Zend\EventManager\EventManager;

class TweetService implements EventManagerAwareInterface
{
	/**
	 * @var EventManagerInterface
	 */
	protected $eventManager;

	/**
	 * @param string $content
	 */
	public function sendTweet($content)
	{
		// Send the tweet with Twitter's API...
		echo "Send the tweet with Twitter's API...";

		// Trigger an event
		$this->getEventManager()->trigger('sendTweet', null, array('content' => $content));
	}

	/**
	 * @param  EventManagerInterface $eventManager
	 * @return void
	 */
	public function setEventManager(EventManagerInterface $eventManager)
	{
		/* With eventManager */
		//$this->eventManager = $eventManager;
		
		/* With Shared eventManager*/
		$eventManager->addIdentifiers(array(
				get_called_class()
		));
		
		/* With a more generic Identifier */
		/*
		$eventManager->addIdentifiers(array(
				'Application\Service\ServiceInterface',
				get_called_class()
		));
		*/
		
		$this->eventManager = $eventManager;
		
		
	}

	/**
	 * @return EventManagerInterface
	 */
	public function getEventManager()
	{
		if (null === $this->eventManager) {
			$this->setEventManager(new EventManager());
		}

		return $this->eventManager;
	}
}