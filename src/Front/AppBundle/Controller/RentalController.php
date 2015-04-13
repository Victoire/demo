<?php

namespace Front\AppBundle\Controller;

use Front\AppBundle\Entity\Rental;
use Front\AppBundle\Form\RentalType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * Rental controller.
 *
 * @Route("/rental")
 */
class RentalController extends Controller
{

    /**
     * Lists all Rental entities.
     *
     * @Route("/", name="rental_index")
     * @Method("GET")
     * @Template()
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('AppBundle:Rental')->findAll();
        $response['success'] = true;
        $response['html'] = $this->container->get('victoire_templating')->render(
            'AppBundle:Rental:index.html.twig',
            array(
                'entities' => $entities,
            )
        );

        return new JsonResponse($response);
    }
    /**
     * Creates a new Rental entity.
     *
     * @Route("/", name="rental_create")
     * @Method("POST")
     * @Template("AppBundle:Rental:new.html.twig")
     */
    public function createAction(Request $request)
    {
        $entity = new Rental();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('rental_index'));
        }

        $response['success'] = true;
        $response['html'] = $this->container->get('victoire_templating')->render(
            'AppBundle:Rental:new.html.twig',
            array(
            'entity' => $entity,
            'form'   => $form->createView(),
            )
        );

        return new JsonResponse($response);
    }

    /**
     * Creates a form to create a Rental entity.
     *
     * @param Rental $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Rental $entity)
    {
        $form = $this->createForm(new RentalType(), $entity, array(
            'action' => $this->generateUrl('rental_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array(
            'label' => 'Créer',
            'attr' => array(
                'data-toggle' => 'vic-modal',
            ),
        ));

        return $form;
    }

    /**
     * Displays a form to create a new Rental entity.
     *
     * @Route("/new", name="rental_new")
     * @Method("GET")
     * @Template()
     */
    public function newAction()
    {
        $entity = new Rental();
        $form   = $this->createCreateForm($entity);

        $response['success'] = true;
        $response['html'] = $this->container->get('victoire_templating')->render(
            'AppBundle:Rental:new.html.twig',
            array(
            'entity' => $entity,
            'form'   => $form->createView(),
            )
        );

        return new JsonResponse($response);
    }

    /**
     * Displays a form to edit an existing Rental entity.
     *
     * @Route("/{id}/edit", name="rental_edit")
     * @Method("GET")
     * @Template()
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Rental')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Rental entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        $response['success'] = true;
        $response['html'] = $this->container->get('victoire_templating')->render(
            'AppBundle:Rental:edit.html.twig',
            array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            )
        );

        return new JsonResponse($response);
    }

    /**
    * Creates a form to edit a Rental entity.
    *
    * @param Rental $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Rental $entity)
    {
        $form = $this->createForm(new RentalType(), $entity, array(
            'action' => $this->generateUrl('rental_update', array('id' => $entity->getId())),
            'method' => 'PUT',
            'attr' => array(
                'data-toggle' => 'vic-modal',
            ),
        ));

        $form->add('submit', 'submit', array(
            'label' => 'Valider',
        ));

        return $form;
    }
    /**
     * Edits an existing Rental entity.
     *
     * @Route("/{id}", name="rental_update")
     * @Method("PUT")
     * @Template("AppBundle:Rental:edit.html.twig")
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('AppBundle:Rental')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Rental entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('rental_edit', array('id' => $id)));
        }

        $response['success'] = true;
        $response['html'] = $this->container->get('victoire_templating')->render(
            'AppBundle:Rental:edit.html.twig',
            array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
            )
        );

        return new JsonResponse($response);
    }
    /**
     * Deletes a Rental entity.
     *
     * @Route("/{id}", name="rental_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('AppBundle:Rental')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Rental entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('rental_index'));
    }

    /**
     * Creates a form to delete a Rental entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('rental_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Supprimer'))
            ->getForm()
        ;
    }
}
