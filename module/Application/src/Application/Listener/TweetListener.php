<?php
namespace Application\Listener;

use Zend\EventManager\EventManagerInterface;
use Zend\EventManager\ListenerAggregateInterface;

class TweetListener implements ListenerAggregateInterface
{
	/**
	 * @var \Zend\Stdlib\CallbackHandler[]
	 */
	protected $listeners = array();

	/**
	 * {@inheritDoc}
	*/
	public function attach(EventManagerInterface $events)
	{
		$sharedEvents      = $events->getSharedManager();
		$this->listeners[] = $sharedEvents->attach('Application\Service\TweetService', 'sendTweet', array($this, 'onSendTweet'), 100);
	}

	public function detach(EventManagerInterface $events)
	{
		foreach ($this->listeners as $index => $listener) {
			if ($events->detach($listener)) {
				unset($this->listeners[$index]);
			}
		}
	}

	public function onSendTweet($e)
	{
		var_dump("Esto es onSendTwet");
	}
}