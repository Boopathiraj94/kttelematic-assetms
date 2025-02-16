PGDMP  -    1                 |            assetKT    16.1    16.1 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    assetKT    DATABASE     �   CREATE DATABASE "assetKT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "assetKT";
                postgres    false            X           1247    24655    status    TYPE     N   CREATE TYPE public.status AS ENUM (
    'ISSUE',
    'RETURN',
    'SCRAP'
);
    DROP TYPE public.status;
       public          postgres    false            �            1259    24595    assetmasters    TABLE     �  CREATE TABLE public.assetmasters (
    id integer NOT NULL,
    serialno text NOT NULL,
    make text NOT NULL,
    model text NOT NULL,
    purchasecost double precision NOT NULL,
    purchasedate date NOT NULL,
    supplier text NOT NULL,
    "categoryId" integer NOT NULL,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isactive integer DEFAULT 1 NOT NULL,
    status text,
    returnstatus text,
    isscrap integer DEFAULT 0,
    "employeeId" integer
);
     DROP TABLE public.assetmasters;
       public         heap    postgres    false            �            1259    24594    assetmaster_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assetmaster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.assetmaster_id_seq;
       public          postgres    false    220            �           0    0    assetmaster_id_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.assetmaster_id_seq OWNED BY public.assetmasters.id;
          public          postgres    false    219            �            1259    24584 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    categoryname text,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    isactive integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    24583    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    218            �           0    0    category_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.category_id_seq OWNED BY public.categories.id;
          public          postgres    false    217            �            1259    16399 	   employees    TABLE     �   CREATE TABLE public.employees (
    id integer NOT NULL,
    name text,
    email text,
    phone text,
    isactive integer,
    password text,
    role text
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16398    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    216            �           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    215            �            1259    24671    issueassets    TABLE     �   CREATE TABLE public.issueassets (
    id integer NOT NULL,
    "employeeId" integer,
    "assetmasterId" integer NOT NULL,
    status text,
    returnstatus text,
    reason text,
    addedat timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.issueassets;
       public         heap    postgres    false            �            1259    24670    issueassets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.issueassets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.issueassets_id_seq;
       public          postgres    false    222            �           0    0    issueassets_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.issueassets_id_seq OWNED BY public.issueassets.id;
          public          postgres    false    221            0           2604    24598    assetmasters id    DEFAULT     q   ALTER TABLE ONLY public.assetmasters ALTER COLUMN id SET DEFAULT nextval('public.assetmaster_id_seq'::regclass);
 >   ALTER TABLE public.assetmasters ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            -           2604    24587    categories id    DEFAULT     l   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            ,           2604    16402    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            4           2604    24674    issueassets id    DEFAULT     p   ALTER TABLE ONLY public.issueassets ALTER COLUMN id SET DEFAULT nextval('public.issueassets_id_seq'::regclass);
 =   ALTER TABLE public.issueassets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �          0    24595    assetmasters 
   TABLE DATA           �   COPY public.assetmasters (id, serialno, make, model, purchasecost, purchasedate, supplier, "categoryId", added_at, isactive, status, returnstatus, isscrap, "employeeId") FROM stdin;
    public          postgres    false    220   x)       �          0    24584 
   categories 
   TABLE DATA           J   COPY public.categories (id, categoryname, added_at, isactive) FROM stdin;
    public          postgres    false    218   H*       �          0    16399 	   employees 
   TABLE DATA           U   COPY public.employees (id, name, email, phone, isactive, password, role) FROM stdin;
    public          postgres    false    216   �*       �          0    24671    issueassets 
   TABLE DATA           o   COPY public.issueassets (id, "employeeId", "assetmasterId", status, returnstatus, reason, addedat) FROM stdin;
    public          postgres    false    222   �+       �           0    0    assetmaster_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.assetmaster_id_seq', 12, true);
          public          postgres    false    219            �           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 6, true);
          public          postgres    false    217            �           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 18, true);
          public          postgres    false    215            �           0    0    issueassets_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.issueassets_id_seq', 28, true);
          public          postgres    false    221            ;           2606    24603    assetmasters assetmaster_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.assetmasters
    ADD CONSTRAINT assetmaster_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.assetmasters DROP CONSTRAINT assetmaster_pkey;
       public            postgres    false    220            9           2606    24592    categories category_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT category_pkey;
       public            postgres    false    218            7           2606    16406    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    216            =           2606    24679    issueassets issueassets_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.issueassets
    ADD CONSTRAINT issueassets_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.issueassets DROP CONSTRAINT issueassets_pkey;
       public            postgres    false    222            >           2606    24605    assetmasters as_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.assetmasters
    ADD CONSTRAINT as_fk1 FOREIGN KEY ("categoryId") REFERENCES public.categories(id) NOT VALID;
 =   ALTER TABLE ONLY public.assetmasters DROP CONSTRAINT as_fk1;
       public          postgres    false    4665    220    218            ?           2606    24680    issueassets issueassets_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY public.issueassets
    ADD CONSTRAINT issueassets_fk1 FOREIGN KEY ("employeeId") REFERENCES public.employees(id);
 E   ALTER TABLE ONLY public.issueassets DROP CONSTRAINT issueassets_fk1;
       public          postgres    false    222    216    4663            @           2606    24685    issueassets issueassets_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY public.issueassets
    ADD CONSTRAINT issueassets_fk2 FOREIGN KEY ("assetmasterId") REFERENCES public.assetmasters(id);
 E   ALTER TABLE ONLY public.issueassets DROP CONSTRAINT issueassets_fk2;
       public          postgres    false    220    222    4667            �   �   x�m����@D�5_�(��=��MT$7h���!Ye%�|�9l6�j����B�+�mO��kFw���s^����Ք8��۴"!a*���Y�j����68���-�"�>�f^���$�I����<�(�N��`CF.�{' x��<���|{���_�_o�R��
��s|��P1����ᣏ�9gƘ�_B�      �   �   x�e��
�0����)�3�Lnk���B�n�h�X)��o�R�����6.k�ݼ�
0�k��}>f�OI�)��0>���"��DCKU�i//}ڗg���QL�
T����y��W,5/.�{8w��D�.��"&��h_�R�
.      �   �   x�u�1�0��ˏ)�]�6��v��u9mԴ�)Q�{Q���=x��{X������;���ō�1x0�������}��)$h�,��KD�C��/.J?h��qN\��evH����T�D	]�r��� �w��>�Tm��z��9z      �   �   x�}б�0�<����^��k7��aAS`s5��A�?"0Bn����ˡU��:��O'U���T�)Q�#�H^���E�d̞�F���iAnB��P4xp����鼦놴m�5�`��ɩr;��9�U�\Z����������E�^�}��suݪ����y&7]���@�     