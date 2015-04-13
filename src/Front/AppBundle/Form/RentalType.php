<?php

namespace Front\AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class RentalType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title', null, array(
                'label' => 'front.appbundle.rental.form.title.label'
                )
            )
            ->add('shortDescription', null, array(
                'label' => 'front.appbundle.rental.form.short_description.label'
                )
            )
            ->add('description', null, array(
                'label' => 'front.appbundle.rental.form.description.label'
                )
            )
            ->add('surface', null, array(
                'label' => 'front.appbundle.rental.form.surface.label'
                )
            )
            ->add('picture', 'media', array(
                'label' => 'front.appbundle.rental.form.picture.label'
                ))
            ->add('emissionOfGreenhouse', 'media', array(
                'label' => 'front.appbundle.rental.form.emissionOfGreenhouse.label'
                ))
            ->remove('visibleOnFront')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Front\AppBundle\Entity\Rental'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'front_appbundle_rental';
    }
}
