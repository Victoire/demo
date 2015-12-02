<?php

use Symfony\Component\Config\Loader\LoaderInterface;
use Symfony\Component\HttpKernel\Kernel;

class AppKernel extends Kernel
{
    public function registerBundles()
    {
        $bundles = [
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Symfony\Bundle\AsseticBundle\AsseticBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new Stof\DoctrineExtensionsBundle\StofDoctrineExtensionsBundle(),

            new AppVentus\AjaxBundle\AvAjaxBundle(),
            new AppVentus\AsseticInjectorBundle\AvAsseticInjectorBundle(),
            new AppVentus\AlertifyBundle\AvAlertifyBundle(),
            new AppVentus\Awesome\ShortcutsBundle\AvAwesomeShortcutsBundle(),
            new AppVentus\Awesome\SpoolMailerBundle\AvAwesomeSpoolMailerBundle(),
            new AppVentus\ListBundle\AvListBundle(),
            new JMS\AopBundle\JMSAopBundle(),
            new JMS\DiExtraBundle\JMSDiExtraBundle($this),
            new JMS\I18nRoutingBundle\JMSI18nRoutingBundle(),
            new JMS\SecurityExtraBundle\JMSSecurityExtraBundle(),
            new JMS\TranslationBundle\JMSTranslationBundle(),
            new Knp\Bundle\MenuBundle\KnpMenuBundle(),
            new Lexik\Bundle\FormFilterBundle\LexikFormFilterBundle(),
            new Liip\ImagineBundle\LiipImagineBundle(),
            new Mopa\Bundle\BootstrapBundle\MopaBootstrapBundle(),
            new WhiteOctober\SwiftMailerDBBundle\WhiteOctoberSwiftMailerDBBundle(),
            new FOS\UserBundle\FOSUserBundle(),
            new FOS\JsRoutingBundle\FOSJsRoutingBundle(),
            new Ivory\CKEditorBundle\IvoryCKEditorBundle(),

            //Victoire bundles
            new Victoire\Bundle\CoreBundle\VictoireCoreBundle(),
            new Victoire\Bundle\TwigBundle\VictoireTwigBundle(),
            new Victoire\Bundle\BlogBundle\VictoireBlogBundle(),
            new Victoire\Bundle\BusinessEntityBundle\VictoireBusinessEntityBundle(),
            new Victoire\Bundle\BusinessPageBundle\VictoireBusinessPageBundle(),
            new Victoire\Bundle\FilterBundle\VictoireFilterBundle(),
            new Victoire\Bundle\FormBundle\VictoireFormBundle(),
            new Victoire\Bundle\I18nBundle\VictoireI18nBundle(),
            new Victoire\Bundle\PageBundle\VictoirePageBundle(),
            new Victoire\Bundle\QueryBundle\VictoireQueryBundle(),
            new Victoire\Bundle\MediaBundle\VictoireMediaBundle(),
            new Victoire\Bundle\SeoBundle\VictoireSeoBundle(),
            new Victoire\Bundle\SitemapBundle\VictoireSitemapBundle(),
            new Victoire\Bundle\TemplateBundle\VictoireTemplateBundle(),
            new Victoire\Bundle\UserBundle\VictoireUserBundle(),
            new Victoire\Bundle\WidgetBundle\VictoireWidgetBundle(),
            new Victoire\Bundle\WidgetMapBundle\VictoireWidgetMapBundle(),
            new Victoire\Bundle\AnalyticsBundle\VictoireAnalyticsBundle(),
            new Victoire\Bundle\ViewReferenceBundle\ViewReferenceBundle(),

            //Victoire Widgets
            new Victoire\Widget\ArticleListBundle\VictoireWidgetArticleListBundle(),
            new Victoire\Widget\BreadcrumbBundle\VictoireWidgetBreadcrumbBundle(),
            new Victoire\Widget\ButtonBundle\VictoireWidgetButtonBundle(),
            new Victoire\Widget\FileBundle\VictoireWidgetFileBundle(),
            new Victoire\Widget\CoverBundle\VictoireWidgetCoverBundle(),
            new Victoire\Widget\DisqusBundle\VictoireWidgetDisqusBundle(),
            new Victoire\Widget\FilterBundle\VictoireWidgetFilterBundle(),
            new Victoire\Widget\HtmlBundle\VictoireWidgetHtmlBundle(),
            new Victoire\Widget\ImageBundle\VictoireWidgetImageBundle(),
            new Victoire\Widget\LayoutBundle\VictoireWidgetLayoutBundle(),
            new Victoire\Widget\ListingBundle\VictoireWidgetListingBundle(),
            new Victoire\Widget\MarkdownBundle\VictoireWidgetMarkdownBundle(),
            new Victoire\Widget\MenuBundle\VictoireWidgetMenuBundle(),
            new Victoire\Widget\RenderBundle\VictoireWidgetRenderBundle(),
            new Victoire\Widget\TextBundle\VictoireWidgetTextBundle(),
            new Victoire\Widget\TitleBundle\VictoireWidgetTitleBundle(),
            new Victoire\Widget\SliderBundle\VictoireWidgetSliderBundle(),
            new Victoire\Widget\SitemapBundle\VictoireWidgetSitemapBundle(),
            new Victoire\Widget\SimpleContactFormBundle\VictoireWidgetSimpleContactFormBundle(),
            new Victoire\Widget\CKEditorBundle\VictoireWidgetCKEditorBundle(),
            new Victoire\Widget\TabBundle\VictoireWidgetTabBundle(),
            new Victoire\Widget\ShareThisBundle\VictoireWidgetShareThisBundle(),

            new Front\TemplateBundle\FrontTemplateBundle(),
            new Front\AppBundle\AppBundle(),
        ];

        if (in_array($this->getEnvironment(), ['dev', 'test'])) {
            $bundles[] = new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
        }

        return $bundles;
    }

    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}
