<?php

namespace Front\TemplateBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    /**
     * @Route("/gui")
     * @Template("FrontTemplateBundle::Pages/gui.html.twig")
     */
    public function guiAction()
    {
        return [];
    }
}
