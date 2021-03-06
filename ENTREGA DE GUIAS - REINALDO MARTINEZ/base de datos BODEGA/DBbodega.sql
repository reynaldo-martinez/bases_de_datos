PGDMP         	                x            bodegaEscorial    12.3    12.3 5    I           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            J           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            K           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            L           1262    24585    bodegaEscorial    DATABASE     �   CREATE DATABASE "bodegaEscorial" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_El Salvador.1252' LC_CTYPE = 'Spanish_El Salvador.1252';
     DROP DATABASE "bodegaEscorial";
                postgres    false            �            1259    24598    articulo    TABLE     E  CREATE TABLE public.articulo (
    id_articulo integer NOT NULL,
    nombre character varying(20) NOT NULL,
    precio numeric,
    stock integer NOT NULL,
    id_categoria integer,
    CONSTRAINT articulo_id_categoria_check CHECK ((id_categoria > 0)),
    CONSTRAINT articulo_precio_check CHECK ((precio > (0)::numeric))
);
    DROP TABLE public.articulo;
       public         heap    postgres    false            M           0    0    TABLE articulo    ACL     I   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.articulo TO despachop;
          public          postgres    false    203            �            1259    24596    articulo_id_articulo_seq    SEQUENCE     �   CREATE SEQUENCE public.articulo_id_articulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.articulo_id_articulo_seq;
       public          postgres    false    203            N           0    0    articulo_id_articulo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.articulo_id_articulo_seq OWNED BY public.articulo.id_articulo;
          public          postgres    false    202            �            1259    24611 	   categoria    TABLE     s   CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    categoria character varying(20) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    24609    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public          postgres    false    205            O           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;
          public          postgres    false    204            �            1259    24633    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying(30) NOT NULL,
    telefono character varying(20) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    24631    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    209            P           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    208            �            1259    24619    compra    TABLE     h  CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    id_articulo integer,
    cantidad integer NOT NULL,
    monto numeric,
    id_cliente integer,
    CONSTRAINT compra_id_articulo_check CHECK ((id_articulo > 0)),
    CONSTRAINT compra_id_cliente_check CHECK ((id_cliente > 0)),
    CONSTRAINT compra_monto_check CHECK ((monto > (0)::numeric))
);
    DROP TABLE public.compra;
       public         heap    postgres    false            Q           0    0    TABLE compra    ACL     O   GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.compra TO vendedorsucursalp;
          public          postgres    false    207            �            1259    24617    compra_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.compra_id_compra_seq;
       public          postgres    false    207            R           0    0    compra_id_compra_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;
          public          postgres    false    206            �            1259    24641 	   entregado    TABLE     �   CREATE TABLE public.entregado (
    id_entregrado integer NOT NULL,
    id_compra integer,
    CONSTRAINT entregado_id_compra_check CHECK ((id_compra > 0))
);
    DROP TABLE public.entregado;
       public         heap    postgres    false            �            1259    24639    entregado_id_entregrado_seq    SEQUENCE     �   CREATE SEQUENCE public.entregado_id_entregrado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.entregado_id_entregrado_seq;
       public          postgres    false    211            S           0    0    entregado_id_entregrado_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.entregado_id_entregrado_seq OWNED BY public.entregado.id_entregrado;
          public          postgres    false    210            �            1259    24650    noentregado    TABLE     �   CREATE TABLE public.noentregado (
    id_noentregrado integer NOT NULL,
    id_compra integer,
    CONSTRAINT noentregado_id_compra_check CHECK ((id_compra > 0))
);
    DROP TABLE public.noentregado;
       public         heap    postgres    false            �            1259    24648    noentregado_id_noentregrado_seq    SEQUENCE     �   CREATE SEQUENCE public.noentregado_id_noentregrado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.noentregado_id_noentregrado_seq;
       public          postgres    false    213            T           0    0    noentregado_id_noentregrado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.noentregado_id_noentregrado_seq OWNED BY public.noentregado.id_noentregrado;
          public          postgres    false    212            �
           2604    24601    articulo id_articulo    DEFAULT     |   ALTER TABLE ONLY public.articulo ALTER COLUMN id_articulo SET DEFAULT nextval('public.articulo_id_articulo_seq'::regclass);
 C   ALTER TABLE public.articulo ALTER COLUMN id_articulo DROP DEFAULT;
       public          postgres    false    202    203    203            �
           2604    24614    categoria id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    24636    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    208    209    209            �
           2604    24622    compra id_compra    DEFAULT     t   ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);
 ?   ALTER TABLE public.compra ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    207    206    207            �
           2604    24644    entregado id_entregrado    DEFAULT     �   ALTER TABLE ONLY public.entregado ALTER COLUMN id_entregrado SET DEFAULT nextval('public.entregado_id_entregrado_seq'::regclass);
 F   ALTER TABLE public.entregado ALTER COLUMN id_entregrado DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    24653    noentregado id_noentregrado    DEFAULT     �   ALTER TABLE ONLY public.noentregado ALTER COLUMN id_noentregrado SET DEFAULT nextval('public.noentregado_id_noentregrado_seq'::regclass);
 J   ALTER TABLE public.noentregado ALTER COLUMN id_noentregrado DROP DEFAULT;
       public          postgres    false    213    212    213            <          0    24598    articulo 
   TABLE DATA           T   COPY public.articulo (id_articulo, nombre, precio, stock, id_categoria) FROM stdin;
    public          postgres    false    203   �=       >          0    24611 	   categoria 
   TABLE DATA           <   COPY public.categoria (id_categoria, categoria) FROM stdin;
    public          postgres    false    205   :>       B          0    24633    cliente 
   TABLE DATA           ?   COPY public.cliente (id_cliente, nombre, telefono) FROM stdin;
    public          postgres    false    209   �>       @          0    24619    compra 
   TABLE DATA           U   COPY public.compra (id_compra, id_articulo, cantidad, monto, id_cliente) FROM stdin;
    public          postgres    false    207   ?       D          0    24641 	   entregado 
   TABLE DATA           =   COPY public.entregado (id_entregrado, id_compra) FROM stdin;
    public          postgres    false    211   C?       F          0    24650    noentregado 
   TABLE DATA           A   COPY public.noentregado (id_noentregrado, id_compra) FROM stdin;
    public          postgres    false    213   h?       U           0    0    articulo_id_articulo_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.articulo_id_articulo_seq', 1, false);
          public          postgres    false    202            V           0    0    categoria_id_categoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 1, false);
          public          postgres    false    204            W           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public          postgres    false    208            X           0    0    compra_id_compra_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.compra_id_compra_seq', 1, false);
          public          postgres    false    206            Y           0    0    entregado_id_entregrado_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.entregado_id_entregrado_seq', 1, false);
          public          postgres    false    210            Z           0    0    noentregado_id_noentregrado_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.noentregado_id_noentregrado_seq', 1, false);
          public          postgres    false    212            �
           2606    24608    articulo articulo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pkey PRIMARY KEY (id_articulo);
 @   ALTER TABLE ONLY public.articulo DROP CONSTRAINT articulo_pkey;
       public            postgres    false    203            �
           2606    24616    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    205            �
           2606    24638    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    209            �
           2606    24630    compra compra_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);
 <   ALTER TABLE ONLY public.compra DROP CONSTRAINT compra_pkey;
       public            postgres    false    207            �
           2606    24647    entregado entregado_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.entregado
    ADD CONSTRAINT entregado_pkey PRIMARY KEY (id_entregrado);
 B   ALTER TABLE ONLY public.entregado DROP CONSTRAINT entregado_pkey;
       public            postgres    false    211            �
           2606    24656    noentregado noentregado_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.noentregado
    ADD CONSTRAINT noentregado_pkey PRIMARY KEY (id_noentregrado);
 F   ALTER TABLE ONLY public.noentregado DROP CONSTRAINT noentregado_pkey;
       public            postgres    false    213            �
           2606    24659    articulo fk_articulo_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT fk_articulo_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);
 H   ALTER TABLE ONLY public.articulo DROP CONSTRAINT fk_articulo_categoria;
       public          postgres    false    2735    203    205            �
           2606    24664    compra fk_compra_articulo    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_articulo FOREIGN KEY (id_articulo) REFERENCES public.articulo(id_articulo);
 C   ALTER TABLE ONLY public.compra DROP CONSTRAINT fk_compra_articulo;
       public          postgres    false    203    2733    207            �
           2606    24669    compra fk_compra_cliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 B   ALTER TABLE ONLY public.compra DROP CONSTRAINT fk_compra_cliente;
       public          postgres    false    207    2739    209            �
           2606    24674    entregado fk_entregado_compra    FK CONSTRAINT     �   ALTER TABLE ONLY public.entregado
    ADD CONSTRAINT fk_entregado_compra FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra);
 G   ALTER TABLE ONLY public.entregado DROP CONSTRAINT fk_entregado_compra;
       public          postgres    false    207    2737    211            �
           2606    24679 !   noentregado fk_noentregado_compra    FK CONSTRAINT     �   ALTER TABLE ONLY public.noentregado
    ADD CONSTRAINT fk_noentregado_compra FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra);
 K   ALTER TABLE ONLY public.noentregado DROP CONSTRAINT fk_noentregado_compra;
       public          postgres    false    213    207    2737            <   v   x�%�A�0��W�Q�� ���+D��HA}q���n���r50�K	A<1������ݲ &D��-������	ߢ��d+�$�|1k��(!k�tkC/B3�����oGD�7 z      >   F   x��K�0�5�0&�n��$������L�/,�0VҦe��w�a��}zt�����LX4qL >�/�      B   p   x�-�1
�0��Y:�OP�l��Z�]ѐE�Yr�6���{�hZ%v1�>q%*	�&�yz�]#�^se��.�iUۮ>�B<�X�.i�A�[CGb��;D��~ ���#�      @   #   x�3�4�4�437�4�2��8ML8��b���� :��      D      x�3�4�2�4����� ��      F      x�3�4����� m      