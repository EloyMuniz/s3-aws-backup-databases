PGDMP              
            |            aws_s3    15.2    15.2 
               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    676022    aws_s3    DATABASE     }   CREATE DATABASE aws_s3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE aws_s3;
                postgres    false            �            1259    676059    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false            �            1259    676068 	   use_users    TABLE     �  CREATE TABLE public.use_users (
    use_uuid uuid DEFAULT gen_random_uuid() NOT NULL,
    use_email character varying(50),
    use_password character varying(255),
    use_date_expire character varying(50),
    use_quant integer,
    use_token character varying(255),
    use_created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    use_updated_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    use_name character varying(255)
);
    DROP TABLE public.use_users;
       public         heap    postgres    false            �          0    676059    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �                  0    676068 	   use_users 
   TABLE DATA           �   COPY public.use_users (use_uuid, use_email, use_password, use_date_expire, use_quant, use_token, use_created_at, use_updated_at, use_name) FROM stdin;
    public          postgres    false    215   �       n           2606    676067 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            p           2606    676077    use_users pk_use 
   CONSTRAINT     T   ALTER TABLE ONLY public.use_users
    ADD CONSTRAINT pk_use PRIMARY KEY (use_uuid);
 :   ALTER TABLE ONLY public.use_users DROP CONSTRAINT pk_use;
       public            postgres    false    215            �   �   x�m��	�0 �Vi@f�Jr��`t�^�1&���y�p�K�}�9�<X}ق`�6qI�,�S��s1�b�a�97���d�t5�m���H�FUH�D@��x�тaa��R���
B
�,������q>��<��}L����AD��uv�}��5,             x������ � �     