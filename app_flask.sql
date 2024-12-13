PGDMP                      |         	   app_flask    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387 	   app_flask    DATABASE     �   CREATE DATABASE app_flask WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE app_flask;
                     postgres    false            �            1259    16388    administrador    TABLE     m   CREATE TABLE public.administrador (
    id_user character varying(20),
    password character varying(20)
);
 !   DROP TABLE public.administrador;
       public         heap r       postgres    false            �            1259    16391    curso_id_curso_seq    SEQUENCE     ~   CREATE SEQUENCE public.curso_id_curso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1;
 )   DROP SEQUENCE public.curso_id_curso_seq;
       public               postgres    false            �            1259    16392    curso    TABLE     �  CREATE TABLE public.curso (
    id_curso integer DEFAULT nextval('public.curso_id_curso_seq'::regclass) NOT NULL,
    nombre character varying(100),
    ponente character varying(100),
    fecha_inicio date,
    fecha_fin date,
    minimo integer,
    maximo integer,
    descripcion text,
    localidad character varying(100),
    salon character varying(100),
    status text DEFAULT 'progreso'::text
);
    DROP TABLE public.curso;
       public         heap r       postgres    false    218            �            1259    16399    curso_trabajador    TABLE     �   CREATE TABLE public.curso_trabajador (
    id_curso integer NOT NULL,
    id_trabajador integer NOT NULL,
    status character varying(10) DEFAULT 'activo'::character varying
);
 $   DROP TABLE public.curso_trabajador;
       public         heap r       postgres    false            �            1259    16403    sec_idtarea    SEQUENCE     t   CREATE SEQUENCE public.sec_idtarea
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sec_idtarea;
       public               postgres    false            �            1259    16404    tarea    TABLE     �   CREATE TABLE public.tarea (
    id_tarea integer DEFAULT nextval('public.sec_idtarea'::regclass) NOT NULL,
    id_curso integer NOT NULL,
    descripcion text
);
    DROP TABLE public.tarea;
       public         heap r       postgres    false    221            �            1259    16410 
   trabajador    TABLE     �   CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    nombre character varying(100),
    apellido character varying(100),
    clave character varying(15)
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �          0    16388    administrador 
   TABLE DATA           :   COPY public.administrador (id_user, password) FROM stdin;
    public               postgres    false    217          �          0    16392    curso 
   TABLE DATA           �   COPY public.curso (id_curso, nombre, ponente, fecha_inicio, fecha_fin, minimo, maximo, descripcion, localidad, salon, status) FROM stdin;
    public               postgres    false    219   /       �          0    16399    curso_trabajador 
   TABLE DATA           K   COPY public.curso_trabajador (id_curso, id_trabajador, status) FROM stdin;
    public               postgres    false    220   �"       �          0    16404    tarea 
   TABLE DATA           @   COPY public.tarea (id_tarea, id_curso, descripcion) FROM stdin;
    public               postgres    false    222   #       �          0    16410 
   trabajador 
   TABLE DATA           L   COPY public.trabajador (id_trabajador, nombre, apellido, clave) FROM stdin;
    public               postgres    false    223   �#       �           0    0    curso_id_curso_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.curso_id_curso_seq', 16, true);
          public               postgres    false    218            �           0    0    sec_idtarea    SEQUENCE SET     9   SELECT pg_catalog.setval('public.sec_idtarea', 7, true);
          public               postgres    false    221            7           2606    16414    curso curso_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);
 :   ALTER TABLE ONLY public.curso DROP CONSTRAINT curso_pkey;
       public                 postgres    false    219            9           2606    16416 &   curso_trabajador curso_trabajador_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT curso_trabajador_pkey PRIMARY KEY (id_curso, id_trabajador);
 P   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT curso_trabajador_pkey;
       public                 postgres    false    220    220            ;           2606    16418    tarea tarea_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_pkey PRIMARY KEY (id_tarea, id_curso);
 :   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_pkey;
       public                 postgres    false    222    222            =           2606    16420    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    223            >           2606    16421    curso_trabajador id_curso    FK CONSTRAINT        ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_curso;
       public               postgres    false    4663    219    220            ?           2606    16426    curso_trabajador id_trabajador    FK CONSTRAINT     �   ALTER TABLE ONLY public.curso_trabajador
    ADD CONSTRAINT id_trabajador FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 H   ALTER TABLE ONLY public.curso_trabajador DROP CONSTRAINT id_trabajador;
       public               postgres    false    4669    223    220            @           2606    16431    tarea tarea_id_curso_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tarea
    ADD CONSTRAINT tarea_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.curso(id_curso);
 C   ALTER TABLE ONLY public.tarea DROP CONSTRAINT tarea_id_curso_fkey;
       public               postgres    false    222    4663    219            �      x�+-.M,���44261����� =�      �   �  x��YMo�F=ӿb�S(�,�$n�©�&�ɗ9��]�2��&�7>��C��z��X�,[R���%�μy��iI=�.�D�na�%��+i����ݖ�������������ᬚW�хґ�c����&!��	��E����ӛXגX���"�H�#9턲���>��4dM�-��)�Lmf��XM;�W�,>@�6��4�ŰKI�>�)�'�%�j�d����|�u�AhV��2��6k	���)=ρF����c�	-�0��@Q嚭E5\O8c2��{-P>L���j��\6�W$!~N����L\gF��Z�2�Z��{q��Q�i0'H0!�H�ڜ�;�K�:���pN �A�	p-�E��@�b��T5��G�V	pIB��!q�3�P�֤�rv;_�t�
��:|m�����>�\���Z�C�\D@��b!j3�ל�z�N���d�䘼r�"�Rrk8M��֕��J�4t�r����h�xG����zH��7� ������:�f�y��h%�
�c�@��BC�$2ȀJ�-OZ3�c�BEs�"����S���$q�)����Lg�r��58�X��*b�0���9���m�D�����T�I��4 ����l>9�6w��@t�|�@4�E.�򋪟�/p0)
ƨ��kHnP������~�7Lvj+�O�aL�FP��;Č �Yb�(���Ϣ�DZ�A:Z�X=)��Kc�z>N��p��ܵ�x��d��ٻ���r�\id��� 
Wt�ж����U��߉�Ok� 5 E�#3lH��PKE	EL����(0��bW�K�F���Jg](!�D��е���N�ⁿm~/�[$UK����Zʲ�A��"'䋰�K0����'`���n_<:�͝��Z��>���C@��a����p��x��n Rq������=LhWﻝq����K�H��``���hZ,�Q��N[��e��?ES� g�XR��Q,����4��ϔ-::&v[e=W����j��\z����u�|6�lE�ǆV�iu���q�����T�~���g!�%�˶z��WzS�:Ӥ{�98�?���3~��ߥ��]j�SE��8���6Z8~%;�)��r	qKu�m���~m�8�W'���Q׏��v����j��h��:�0�V{�_����v�����<���u��v��m���jy6��W?yP�6��a�i���
��}�y>�^�Ά��ݭu �aK����au4*xT�*8ƨG�W��罱>c��ߙ"��P0�^�]��(�Qʏ*�/�bTo�E��������8�K�C�U)��p�w6*yT��2v��
��l}Z]�F�[�6.r͑.k�z��4��'�,F!C�|R�"-4T���J���xa�����j�]�R���|=�������i      �   =   x�34�4��02�LL.�,��24���2�s2�S򹌡B���E�@���"+����� ���      �   _   x��I
�0�ӯ�b��g�4� Id���cUS��K�)o�1i����R���*�h~m��^�$Ţf��gzZaX:�l_v��*}J�8F h� �      �   K   x�367��4�,HL���,�O����2��02�,.I-K����/-	 �)gNif1gN~Aj�����)W� ���     