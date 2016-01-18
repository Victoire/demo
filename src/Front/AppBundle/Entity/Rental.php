<?php

namespace Front\AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use Gedmo\Timestampable\Traits\TimestampableEntity;
use Victoire\Bundle\BusinessEntityBundle\Entity\Traits\BusinessEntityTrait;
use Victoire\Bundle\CoreBundle\Annotations as VIC;

/**
 * @ORM\Entity()
 * @VIC\BusinessEntity({"Listing", "Title", "Text", "Image", "Cover", "Button"})
 **/
class Rental
{
    use BusinessEntityTrait;
    use TimestampableEntity;

    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    /**
     * @var string
     *
     * @ORM\Column(name="title", type="string", length=255)
     * @VIC\BusinessProperty({"textable", "businessParameter"})
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="shortDescription", type="string", length=255)
     * @VIC\BusinessProperty({"textable", "businessParameter"})
     */
    private $shortDescription;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255)
     * @VIC\BusinessProperty({"textable", "businessParameter"})
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="surface", type="string", length=255)
     * @VIC\BusinessProperty({"textable", "businessParameter"})
     */
    private $surface;

    /**
     * @var string
     *
     * @ORM\ManyToOne(targetEntity="\Victoire\Bundle\MediaBundle\Entity\Media")
     * @ORM\JoinColumn(name="picture", referencedColumnName="id", onDelete="CASCADE")
     * @VIC\BusinessProperty("imageable")
     */
    private $picture;

    /**
     * @var string
     *
     * @ORM\ManyToOne(targetEntity="\Victoire\Bundle\MediaBundle\Entity\Media")
     * @ORM\JoinColumn(name="emission_of_greenhouse", referencedColumnName="id", onDelete="CASCADE")
     * @VIC\BusinessProperty("imageable")
     */
    private $emissionOfGreenhouse;

    /**
     * @ORM\Column(name="slug", type="string", length=255)
     * @Gedmo\Slug(fields={"title"}, updatable=false, unique=false)
     * @VIC\BusinessProperty("businessParameter")
     */
    private $slug;

    public function __toString()
    {
        return $this->title;
    }

    /**
     * Get id.
     *
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set id.
     *
     * @param string $id
     *
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

   /**
    * Get title.
    *
    * @return string
    */
   public function getTitle()
   {
       return $this->title;
   }

   /**
    * Set title.
    *
    * @param string $title
    *
    * @return $this
    */
   public function setTitle($title)
   {
       $this->title = $title;

       return $this;
   }

   /**
    * Get shortDescription.
    *
    * @return string
    */
   public function getShortDescription()
   {
       return $this->shortDescription;
   }

   /**
    * Set shortDescription.
    *
    * @param string $shortDescription
    *
    * @return $this
    */
   public function setShortDescription($shortDescription)
   {
       $this->shortDescription = $shortDescription;

       return $this;
   }

   /**
    * Get description.
    *
    * @return string
    */
   public function getDescription()
   {
       return $this->description;
   }

   /**
    * Set description.
    *
    * @param string $description
    *
    * @return $this
    */
   public function setDescription($description)
   {
       $this->description = $description;

       return $this;
   }

   /**
    * Get surface.
    *
    * @return string
    */
   public function getSurface()
   {
       return $this->surface;
   }

   /**
    * Set surface.
    *
    * @param string $surface
    *
    * @return $this
    */
   public function setSurface($surface)
   {
       $this->surface = $surface;

       return $this;
   }

    /**
     * Get picture.
     *
     * @return string
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * Set picture.
     *
     * @param string $picture
     *
     * @return $this
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;

        return $this;
    }

    /**
     * Get emissionOfGreenhouse.
     *
     * @return string
     */
    public function getEmissionOfGreenhouse()
    {
        return $this->emissionOfGreenhouse;
    }

    /**
     * Set emissionOfGreenhouse.
     *
     * @param string $emissionOfGreenhouse
     *
     * @return $this
     */
    public function setEmissionOfGreenhouse($emissionOfGreenhouse)
    {
        $this->emissionOfGreenhouse = $emissionOfGreenhouse;

        return $this;
    }

    /**
     * Get slug.
     *
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }

    /**
     * Set slug.
     *
     * @param string $slug
     *
     * @return $this
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }
}
