module Locale.Legal.Privacy
    ( localePrivacy
    , module Locale.Legal.Prelude
    ) where

import Locale.Prelude (assetPath)
import Locale.Legal.Prelude

commonSEO :: SEO
commonSEO = defaultSEO
    { ogSiteName = Just "Ruzaani"
    , customTags = [lurk|<link rel="stylesheet" href="{{assetPath "css/legal.css"}}">|]
    }

effectiveDate :: Language -> Text
effectiveDate EN = "April 25, 2026"
effectiveDate ES = "25 de abril de 2026"
effectiveDate KO = "2026년 4월 25일"

localePrivacy :: Language -> LegalLocale
localePrivacy EN = LegalLocale
    { seo = commonSEO
        { title = "Ruzaani's Privacy Policy"
        , metaTitle = "Privacy Policy | Ruzaani - AI Business Intelligence Platform"
        , metaDescription = "Read Ruzaani's Privacy Policy to learn about how we collect, use, and protect your information when using our AI Business Intelligence Platform and website."
        , canonical = Just $ domain <> privacyPath EN
        , ogImage = Just $ domain <> "/img/open-graph/home-en.jpg"
        }
    , content = [lurk|
        <h1>Privacy Policy</h1>
        <p><strong>Effective Date:</strong> {{effectiveDate EN}}</p>
        <br>
        <h2>1. Introduction</h2>
        <p>We value the privacy and security of our users. This Privacy Policy outlines how Ruzaani ("we," "us," or "our") collects, uses, and protects your information when you use our website, platform, AI business intelligence tools, and related services (collectively, the "Services").</p>
        <h3>Data Controllers and Processors</h3>
        <p>In relation to personal data collected via our services, our clients (the businesses and agencies using Ruzaani) act as the <strong>data controllers</strong>, while Ruzaani acts as the <strong>data processor</strong>. We process personal data on behalf of our clients in accordance with their instructions.</p>
        <h3>Legal Basis for Processing</h3>
        <p>We process personal data based on the following legal grounds:</p>
        <ul>
            <li><strong>Consent:</strong> When users provide explicit consent to share their data.</li>
            <li><strong>Contract:</strong> To perform services as agreed upon with our clients.</li>
            <li><strong>Legitimate Interest:</strong> For our legitimate business interests in improving our services, personalizing user experience, and ensuring compliance with applicable regulations.</li>
        </ul>
        <p>If you have any questions or concerns regarding our privacy practices, or if you wish to exercise your rights regarding your personal data, please do not hesitate to contact us using the information provided in Section 12. We are committed to protecting your privacy and ensuring that your experience with our services is secure and transparent.</p>
        <h2>2. Information Collection</h2>
        <p>When you interact with our services, we may collect certain types of information to enhance your experience. The information collected includes the following:</p>
        <ul>
            <li><strong>Client Data:</strong> Account information, billing details, API keys, and webhook configurations.</li>
            <li><strong>End-User Data (via Integrations):</strong> Messages, chat logs, metadata, and sender information from connected platforms like Meta (WhatsApp, Instagram DMs, Messenger), Telegram, and Email.</li>
            <li><strong>End-User Data (via Web Tracker):</strong> Behavioral data (pages viewed, custom events), device information (IP address, browser type), and identifiers (click IDs, persistent anonymous browser fingerprints) to facilitate Identity Stitching.</li>
            <li><strong>Cookies and Tracking Technologies:</strong> Our website and Web Tracker use cookies and tracking technologies to analyze traffic and correlate browsing sessions. Clients must ensure they obtain necessary end-user consent before deploying the tracker.</li>
        </ul>
        <h2>3. Use of Information</h2>
        <p>The information we collect is used for various purposes aimed at improving the quality of our services:</p>
        <ul>
            <li><strong>Providing the Services:</strong> Operating our AI agents, CRM, and dashboard.</li>
            <li><strong>AI Processing & Intelligence:</strong> Using AI models to score leads, optimize ad ROI, and personalize interactions. <em>(Note: We do not use proprietary customer data to train our foundational models).</em></li>
            <li><strong>Identity Stitching:</strong> Correlating disparate browsing sessions into a single "Golden Record" for each contact.</li>
            <li><strong>Service Improvement:</strong> Analyzing data to refine chatbot performance, troubleshoot, and enhance our platform.</li>
        </ul>
        <h2>4. Data Sharing and Disclosure</h2>
        <p>We do not sell, rent, or trade personal data. We may share information in the following circumstances:</p>
        <ul>
            <li><strong>Service Providers:</strong> With trusted third-party providers who assist us (e.g., hosting, databases, AI models). These sub-processors are contractually obligated to safeguard data and use it solely for providing services to us.</li>
            <li><strong>Integrated Platforms:</strong> To facilitate messaging and bookings through the APIs of platforms you connect.</li>
            <li><strong>Legal Compliance:</strong> If required by law or to protect rights and safety.</li>
            <li><strong>Business Transfers:</strong> In the event of a merger, acquisition, or sale of assets, data may be transferred to the acquiring entity.</li>
        </ul>
        <h2>5. Data Security</h2>
        <p>We implement technical and organizational measures to protect data from unauthorized access, loss, or misuse:</p>
        <ul>
            <li><strong>Encryption:</strong> Secure transmission and encryption of sensitive tokens.</li>
            <li><strong>Secure Servers:</strong> Data is stored with restricted access and firewall protection.</li>
            <li><strong>Access Controls:</strong> Multi-tenant architecture and strict internal access protocols.</li>
        </ul>
        <p><strong>Data Breach Procedures:</strong> In the event of a security breach compromising personal data, we will notify affected Clients within 72 hours so they can take appropriate action and notify their end-users.</p>
        <h2>6. User Rights and Choices</h2>
        <p>As a user or data subject, you have certain rights regarding the information we collect:</p>
        <ul>
            <li><strong>Access to Your Data:</strong> You may request access to the personal data we hold about you.</li>
            <li><strong>Correction of Your Data:</strong> You may request correction of inaccurate data.</li>
            <li><strong>Deletion of Your Data:</strong> You have the right to request the deletion of your personal data.</li>
            <li><strong>Opting Out:</strong> You can opt out of certain data collection activities by adjusting your browser settings.</li>
            <li><strong>Data Portability:</strong> You may request a copy of your personal data in a structured format.</li>
        </ul>
        <p><em>Note: If you are an end-user of one of our Clients, please direct your privacy requests directly to the Client (the data controller).</em></p>
        <h2>7. Retention of Data</h2>
        <p>We retain personal data only for as long as necessary:</p>
        <ul>
            <li><strong>Account Data:</strong> Retained as long as your account is active.</li>
            <li><strong>Conversation and Behavioral Data:</strong> Retained as long as necessary to provide the Services and improve AI performance, subject to your configuration and deletion requests.</li>
        </ul>
        <h2>8. International Transfers</h2>
        <p>Our systems are deployed on global infrastructure. Your personal data may be transferred to, stored, and processed in countries other than the country in which it was collected. In such cases, we ensure that adequate safeguards are in place (such as Standard Contractual Clauses or Data Processing Agreements) to protect your information.</p>
        <h2>9. Third-Party Services</h2>
        <p>Our services integrate with third-party platforms that have their own privacy policies. We encourage you to review them:</p>
        <ul>
            <li><strong>AI Platforms:</strong> OpenAI, Google (Gemini), Anthropic.</li>
            <li><strong>Social Media Integrations:</strong> Meta (Facebook, Instagram, WhatsApp), Telegram.</li>
        </ul>
        <h2>10. Children's Privacy</h2>
        <p>Our Services are not intended for children under the age of 13, and we do not knowingly collect personal information from children. If we become aware that we have inadvertently collected such information, we will take appropriate steps to delete it.</p>
        <p>If you believe that a child has provided us with personal data, please contact us immediately using the information provided in Section 12, and we will take appropriate steps to delete such data from our records.</p>
        <h2>11. Changes to the Privacy Policy</h2>
        <p>We may update this Privacy Policy from time to time. We will notify you of any material changes by posting the new Privacy Policy on this page. The updated policy becomes valid and effective immediately upon its publication.</p>
        <h2>12. Legal Entity & Contact Information</h2>
        <p>"Ruzaani" is a commercial brand and service operated by Fernando Alberto Ocampo Romay. For the purposes of data protection compliance, Fernando Alberto Ocampo Romay is the legally responsible entity providing the Ruzaani platform.</p>
        <p>If you have any questions, concerns, or requests regarding this Privacy Policy, our data practices, or to exercise your privacy rights, please contact us at:</p>
        <p><strong>Responsible Entity:</strong> Fernando Alberto Ocampo Romay<br/><strong>Email:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }

localePrivacy ES = LegalLocale
    { seo = commonSEO
        { title = "Política de Privacidad de Ruzaani"
        , metaTitle = "Política de Privacidad | Ruzaani - Plataforma de inteligencia empresarial"
        , metaDescription = "Lee la Política de Privacidad de Ruzaani para saber cómo recopilamos, usamos y protegemos tu información cuando usas nuestra plataforma de inteligencia empresarial"
        , canonical = Just $ domain <> privacyPath ES
        , ogImage = Just $ domain <> "/img/open-graph/home-es.jpg"
        }
    , content = [lurk|
        <h1>Política de Privacidad</h1>
        <p><strong>Fecha de publicación:</strong> {{effectiveDate ES}}</p>
        <br>
        <h2>1. Introducción</h2>
        <p>Valoramos la privacidad y seguridad de nuestros usuarios. Esta Política de Privacidad describe cómo Ruzaani ("nosotros", "nos" o "nuestro") recopila, utiliza y protege su información cuando utiliza nuestro sitio web, plataforma, herramientas de inteligencia empresarial de IA y servicios relacionados (colectivamente, los "Servicios").</p>
        <h3>Responsables y Encargados del Tratamiento de Datos</h3>
        <p>En relación con los datos personales recopilados a través de nuestros servicios, nuestros clientes (las empresas y agencias que utilizan Ruzaani) actúan como <strong>responsables del tratamiento de datos</strong>, mientras que Ruzaani actúa como <strong>encargado del tratamiento de datos</strong>. Procesamos los datos personales en nombre de nuestros clientes de acuerdo con sus instrucciones.</p>
        <h3>Base Legal para el Procesamiento</h3>
        <p>Procesamos datos personales basados en los siguientes fundamentos legales:</p>
        <ul>
            <li><strong>Consentimiento:</strong> Cuando los usuarios otorgan su consentimiento explícito para compartir sus datos.</li>
            <li><strong>Contrato:</strong> Para prestar servicios según lo acordado con nuestros clientes.</li>
            <li><strong>Interés Legítimo:</strong> Para nuestros intereses comerciales legítimos de mejorar nuestros servicios, personalizar la experiencia del usuario y garantizar el cumplimiento de las normativas aplicables.</li>
        </ul>
        <p>Si tiene alguna pregunta o inquietud sobre nuestras prácticas de privacidad, o si desea ejercer sus derechos sobre sus datos personales, no dude en contactarnos utilizando la información proporcionada en la Sección 12. Estamos comprometidos a proteger su privacidad y asegurar que su experiencia con nuestros servicios sea segura y transparente.</p>
        <h2>2. Recopilación de Información</h2>
        <p>Al interactuar con nuestros servicios, podemos recopilar ciertos tipos de información para mejorar su experiencia. La información recopilada incluye lo siguiente:</p>
        <ul>
            <li><strong>Datos del Cliente:</strong> Información de la cuenta, detalles de facturación, claves API y configuraciones de webhooks.</li>
            <li><strong>Datos de los Usuarios Finales (vía Integraciones):</strong> Mensajes, registros de chat, metadatos e información del remitente de las plataformas conectadas como Meta (WhatsApp, Instagram DMs, Messenger), Telegram y Correo Electrónico.</li>
            <li><strong>Datos de los Usuarios Finales (vía Web Tracker):</strong> Datos de comportamiento (páginas visitadas, eventos personalizados), información del dispositivo (dirección IP, tipo de navegador) e identificadores (ID de clics, huellas digitales anónimas y persistentes del navegador) para facilitar la vinculación de identidad (Identity Stitching).</li>
            <li><strong>Cookies y Tecnologías de Rastreo:</strong> Nuestro sitio web y Web Tracker utilizan cookies y tecnologías de rastreo para analizar el tráfico y correlacionar las sesiones de navegación. Los clientes deben asegurarse de obtener el consentimiento necesario de los usuarios finales antes de implementar el rastreador.</li>
        </ul>
        <h2>3. Uso de la Información</h2>
        <p>La información que recopilamos se utiliza para diversos fines destinados a mejorar la calidad de nuestros servicios:</p>
        <ul>
            <li><strong>Provisión de los Servicios:</strong> Operación de nuestros agentes de IA, CRM y panel de control.</li>
            <li><strong>Procesamiento de IA e Inteligencia:</strong> Uso de modelos de IA para calificar prospectos (leads), optimizar el ROI de anuncios y personalizar interacciones. <em>(Nota: No utilizamos los datos privados de los clientes para entrenar nuestros modelos fundacionales).</em></li>
            <li><strong>Vinculación de Identidad (Identity Stitching):</strong> Correlacionar sesiones de navegación dispersas en un "Registro Dorado" único para cada contacto.</li>
            <li><strong>Mejora del Servicio:</strong> Analizar datos para perfeccionar el rendimiento del chatbot, solucionar problemas y mejorar nuestra plataforma.</li>
        </ul>
        <h2>4. Intercambio y Divulgación de Datos</h2>
        <p>No vendemos, alquilamos ni comercializamos datos personales. Podemos compartir información en las siguientes circunstancias:</p>
        <ul>
            <li><strong>Proveedores de Servicios:</strong> Con proveedores de terceros de confianza que nos asisten (ej., alojamiento web, bases de datos, modelos de IA). Estos sub-encargados están obligados contractualmente a salvaguardar los datos y usarlos exclusivamente para proveernos servicios.</li>
            <li><strong>Plataformas Integradas:</strong> Para facilitar mensajes y reservas a través de las APIs de las plataformas que usted conecte.</li>
            <li><strong>Cumplimiento Legal:</strong> Si la ley lo exige o para proteger derechos y seguridad.</li>
            <li><strong>Transferencias Comerciales:</strong> En caso de fusión, adquisición o venta de activos, los datos podrían ser transferidos a la entidad adquirente.</li>
        </ul>
        <h2>5. Seguridad de los Datos</h2>
        <p>Implementamos medidas técnicas y organizativas para proteger los datos contra accesos no autorizados, pérdidas o usos indebidos:</p>
        <ul>
            <li><strong>Cifrado:</strong> Transmisión segura y cifrado de tokens sensibles.</li>
            <li><strong>Servidores Seguros:</strong> Los datos se almacenan con acceso restringido y protección por firewall.</li>
            <li><strong>Controles de Acceso:</strong> Arquitectura multi-inquilino y protocolos estrictos de acceso interno.</li>
        </ul>
        <p><strong>Procedimientos en caso de Brecha de Datos:</strong> En caso de una brecha de seguridad que comprometa datos personales, notificaremos a los Clientes afectados en un plazo de 72 horas para que puedan tomar las medidas correspondientes y notificar a sus usuarios finales.</p>
        <h2>6. Derechos y Opciones del Usuario</h2>
        <p>Como usuario o titular de los datos, tiene ciertos derechos con respecto a la información que recopilamos:</p>
        <ul>
            <li><strong>Accesso a sus Datos:</strong> Puede solicitar acceso a los datos personales que tenemos sobre usted.</li>
            <li><strong>Corrección de sus Datos:</strong> Puede solicitar la corrección de datos inexactos.</li>
            <li><strong>Eliminación de sus Datos:</strong> Tiene el derecho de solicitar la eliminación de sus datos personales.</li>
            <li><strong>Exclusión Voluntaria (Opt-out):</strong> Puede optar por no participar en ciertas actividades de recopilación de datos ajustando la configuración de su navegador.</li>
            <li><strong>Portabilidad de los Datos:</strong> Puede solicitar una copia de sus datos personales en un formato estructurado.</li>
        </ul>
        <p><em>Nota: Si usted es un usuario final de uno de nuestros Clientes, dirija sus solicitudes de privacidad directamente al Cliente (el responsable del tratamiento).</em></p>
        <h2>7. Retención de Datos</h2>
        <p>Retenemos los datos personales solo durante el tiempo que sea necesario:</p>
        <ul>
            <li><strong>Datos de la Cuenta:</strong> Se retienen mientras su cuenta esté activa.</li>
            <li><strong>Datos de Conversación y Comportamiento:</strong> Se retienen durante el tiempo necesario para proveer los Servicios y mejorar el rendimiento de la IA, sujetos a su configuración y solicitudes de eliminación.</li>
        </ul>
        <h2>8. Transferencias Internacionales</h2>
        <p>Nuestros sistemas se implementan en infraestructura global. Sus datos personales pueden ser transferidos, almacenados y procesados en países distintos a aquel en el que fueron recopilados. En tales casos, nos aseguramos de que existan salvaguardas adecuadas (como Cláusulas Contractuales Tipo o Acuerdos de Procesamiento de Datos) para proteger su información.</p>
        <h2>9. Servicios de Terceros</h2>
        <p>Nuestros servicios se integran con plataformas de terceros que tienen sus propias políticas de privacidad. Le recomendamos que las revisen:</p>
        <ul>
            <li><strong>Plataformas de IA:</strong> OpenAI, Google (Gemini), Anthropic.</li>
            <li><strong>Integraciones de Redes Sociales:</strong> Meta (Facebook, Instagram, WhatsApp), Telegram.</li>
        </ul>
        <h2>10. Privacidad de los Menores</h2>
        <p>Nuestros Servicios no están dirigidos a niños menores de 13 años, y no recopilamos a sabiendas información personal de menores. Si nos damos cuenta de que hemos recopilado inadvertidamente dicha información, tomaremos las medidas adecuadas para eliminarla.</p>
        <p>Si cree que un menor nos ha proporcionado datos personales, comuníquese con nosotros de inmediato utilizando la información proporcionada en la Sección 12, y tomaremos las medidas adecuadas para eliminar esos datos de nuestros registros.</p>
        <h2>11. Cambios en la Política de Privacidad</h2>
        <p>Podemos actualizar esta Política de Privacidad de vez en cuando. Le notificaremos cualquier cambio importante publicando la nueva Política de Privacidad en esta página. La política actualizada entra en vigor y es efectiva inmediatamente después de su publicación.</p>
        <h2>12. Entidad Legal e Información de Contacto</h2>
        <p>"Ruzaani" es una marca comercial y un servicio operado por Fernando Alberto Ocampo Romay. Para fines de cumplimiento de protección de datos, Fernando Alberto Ocampo Romay es la entidad legalmente responsable que provee la plataforma Ruzaani.</p>
        <p>Si tiene alguna pregunta, inquietud o solicitud con respecto a esta Política de Privacidad, nuestras prácticas de datos, o para ejercer sus derechos de privacidad, por favor contáctenos en:</p>
        <p><strong>Entidad Responsable:</strong> Fernando Alberto Ocampo Romay<br/><strong>Correo Electrónico:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }

localePrivacy KO = LegalLocale
    { seo = commonSEO
        { title = "Ruzaani의 개인정보 처리방침"
        , metaTitle = "개인정보 처리방침 | Ruzaani - 인공지능 기반 비즈니스 인텔리전스 플랫폼"
        , metaDescription = "인공지능 기반 비즈니스 인텔리전스 플랫폼을 이용할 때 Ruzaani가 귀하의 정보를 수집, 사용 및 보호하는 방법을 알아보려면 Ruzaani의 개인정보 처리방침을 읽어보십시오."
        , canonical = Just $ domain <> privacyPath KO
        , ogImage = Just $ domain <> "/img/open-graph/home-ko.jpg"
        }
    , content = [lurk|
        <h1>개인정보 처리방침</h1>
        <p><strong>시행일:</strong> {{effectiveDate KO}}</p>
        <br>
        <h2>1. 개요</h2>
        <p>우리는 사용자의 개인정보와 보안을 중요하게 생각합니다. 본 개인정보 처리방침은 귀하가 당사의 웹사이트, 플랫폼, AI 비즈니스 인텔리전스 도구 및 관련 서비스(이하 "서비스")를 사용할 때 Ruzaani(이하 "당사")가 귀하의 정보를 수집, 사용 및 보호하는 방법을 설명합니다.</p>
        <h3>개인정보처리자 및 수탁자</h3>
        <p>당사의 서비스를 통해 수집된 개인정보와 관련하여, 당사의 고객(Ruzaani를 사용하는 기업 및 기관)은 <strong>개인정보처리자(Data Controller)</strong>의 역할을 하며, Ruzaani는 <strong>개인정보수탁자(Data Processor)</strong>의 역할을 합니다. 당사는 고객의 지시에 따라 고객을 대신하여 개인정보를 처리합니다.</p>
        <h3>처리의 법적 근거</h3>
        <p>당사는 다음의 법적 근거를 바탕으로 개인정보를 처리합니다:</p>
        <ul>
            <li><strong>동의:</strong> 사용자가 자신의 데이터 공유에 명시적으로 동의한 경우.</li>
            <li><strong>계약:</strong> 고객과 합의된 서비스를 이행하기 위한 경우.</li>
            <li><strong>정당한 이익:</strong> 서비스 개선, 사용자 경험 맞춤화 및 관련 규정 준수 보장과 같은 당사의 정당한 비즈니스 이익을 위한 경우.</li>
        </ul>
        <p>당사의 개인정보 처리 관행에 대한 질문이나 우려 사항이 있거나, 귀하의 개인정보와 관련된 권리를 행사하고자 하는 경우 제12조에 제공된 연락처를 통해 언제든지 당사에 문의하시기 바랍니다. 당사는 귀하의 개인정보를 보호하고 서비스 이용 경험이 안전하고 투명하게 유지되도록 최선을 다하고 있습니다.</p>
        <h2>2. 정보 수집</h2>
        <p>당사는 귀하가 당사의 AI 기반 서비스와 상호작용할 때 경험을 향상시키기 위해 특정 유형의 정보를 수집할 수 있습니다. 수집되는 정보는 다음과 같습니다:</p>
        <ul>
            <li><strong>고객 데이터:</strong> 계정 정보, 청구 세부 정보, API 키 및 웹훅(webhook) 설정.</li>
            <li><strong>최종 사용자 데이터 (연동을 통한 수집):</strong> Meta(WhatsApp, Instagram DM, Messenger), Telegram 및 이메일과 같은 연결된 플랫폼의 메시지, 채팅 로그, 메타데이터 및 발신자 정보.</li>
            <li><strong>최종 사용자 데이터 (웹 트래커를 통한 수집):</strong> 식별 통합(Identity Stitching)을 용이하게 하기 위한 행동 데이터(페이지 조회수, 맞춤 이벤트), 기기 정보(IP 주소, 브라우저 유형) 및 식별자(클릭 ID, 지속성 익명 브라우저 지문).</li>
            <li><strong>쿠키 및 추적 기술:</strong> 당사의 웹사이트와 웹 트래커는 트래픽을 분석하고 브라우징 세션을 연관시키기 위해 쿠키 및 추적 기술을 사용합니다. 고객은 트래커를 배포하기 전에 최종 사용자의 필요한 동의를 반드시 얻어야 합니다.</li>
        </ul>
        <h2>3. 정보의 이용</h2>
        <p>당사가 수집한 정보는 서비스 품질을 향상시키기 위한 다양한 목적으로 사용됩니다:</p>
        <ul>
            <li><strong>서비스 제공:</strong> AI 에이전트, CRM 및 대시보드의 운영.</li>
            <li><strong>AI 처리 및 인텔리전스:</strong> 잠재 고객(리드) 평가, 광고 ROI 최적화 및 상호작용 맞춤화를 위한 AI 모델 사용. <em>(참고: 당사는 당사의 파운데이션 모델을 학습시키기 위해 고객의 독점적인 데이터를 사용하지 않습니다).</em></li>
            <li><strong>식별 통합(Identity Stitching):</strong> 각 연락처에 대해 흩어진 브라우징 세션을 연관시켜 단일 "골든 레코드(Golden Record)"로 통합.</li>
            <li><strong>서비스 개선:</strong> 챗봇 성능 개선, 문제 해결 및 플랫폼 향상을 위한 데이터 분석.</li>
        </ul>
        <h2>4. 데이터 공유 및 공개</h2>
        <p>당사는 개인정보를 판매, 임대 또는 거래하지 않습니다. 당사는 다음과 같은 상황에서 정보를 공유할 수 있습니다:</p>
        <ul>
            <li><strong>서비스 제공업체:</strong> 당사를 지원하는 신뢰할 수 있는 제3자 제공업체(예: 호스팅, 데이터베이스, AI 모델). 이러한 하위 수탁자(sub-processors)는 데이터를 보호하고 당사에 서비스를 제공하는 목적으로만 데이터를 사용하도록 계약상 의무를 집니다.</li>
            <li><strong>연동 플랫폼:</strong> 귀하가 연결한 플랫폼의 API를 통해 메시징 및 예약을 촉진하기 위한 경우.</li>
            <li><strong>법적 규정 준수:</strong> 법률에 의해 요구되거나 권리 및 안전을 보호하기 위한 경우.</li>
            <li><strong>비즈니스 이전:</strong> 합병, 인수 또는 자산 매각이 발생하는 경우 데이터가 인수 기관으로 이전될 수 있습니다.</li>
        </ul>
        <h2>5. 데이터 보안</h2>
        <p>당사는 무단 접근, 손실 또는 오용으로부터 데이터를 보호하기 위해 기술적 및 조직적 조치를 구현합니다:</p>
        <ul>
            <li><strong>암호화:</strong> 민감한 토큰의 안전한 전송 및 암호화.</li>
            <li><strong>보안 서버:</strong> 데이터는 접근이 제한되고 방화벽 보호가 적용된 서버에 저장됩니다.</li>
            <li><strong>접근 통제:</strong> 멀티 테넌트 아키텍처 및 엄격한 내부 접근 프로토콜.</li>
        </ul>
        <p><strong>데이터 유출 절차:</strong> 개인정보가 손상되는 보안 침해 사고가 발생할 경우, 당사는 영향을 받는 고객이 적절한 조치를 취하고 최종 사용자에게 통지할 수 있도록 72시간 이내에 통보합니다.</p>
        <h2>6. 사용자의 권리 및 선택권</h2>
        <p>사용자 또는 정보 주체로서 귀하가 당사가 수집한 정보에 대해 다음과 같은 권리를 가집니다:</p>
        <ul>
            <li><strong>데이터 접근권:</strong> 귀하는 당사가 보유한 귀하의 개인정보에 대한 접근을 요청할 수 있습니다.</li>
            <li><strong>데이터 정정권:</strong> 귀하는 부정확한 데이터의 정정을 요청할 수 있습니다.</li>
            <li><strong>데이터 삭제권:</strong> 귀하는 개인정보의 삭제를 요청할 권리가 있습니다.</li>
            <li><strong>수집 거부(Opting Out):</strong> 브라우저 설정을 조정하여 특정 데이터 수집 활동을 거부할 수 있습니다.</li>
            <li><strong>데이터 이동권:</strong> 귀하는 구조화된 형식으로 개인정보 사본을 요청할 수 있습니다.</li>
        </ul>
        <p><em>참고: 귀하가 당사 고객의 최종 사용자인 경우, 개인정보 관련 요청은 해당 고객(개인정보처리자)에게 직접 문의하시기 바랍니다.</em></p>
        <h2>7. 데이터 보존</h2>
        <p>당사는 필요한 기간 동안만 개인정보를 보존합니다:</p>
        <ul>
            <li><strong>계정 데이터:</strong> 귀하의 계정 활성화되어 있는 동안 보존됩니다.</li>
            <li><strong>대화 및 행동 데이터:</strong> 서비스 제공 및 AI 성능 개선에 필요한 기간 동안 보존되며, 귀하의 설정 및 삭제 요청에 따라 달라집니다.</li>
        </ul>
        <h2>8. 국외 이전</h2>
        <p>당사의 시스템은 글로벌 인프라에 배포되어 있습니다. 귀하의 개인정보는 수집된 국가 이외의 국가로 이전, 저장 및 처리될 수 있습니다. 이러한 경우, 당사는 귀하의 정보를 보호하기 위해 적절한 안전 장치(예: 표준 계약 조항 또는 데이터 처리 계약)가 마련되어 있는지 확인합니다.</p>
        <h2>9. 제3자 서비스</h2>
        <p>당사의 서비스는 자체적인 개인정보 처리방침을 가진 제3자 플랫폼과 통합됩니다. 이들의 정책을 검토할 것을 권장합니다:</p>
        <ul>
            <li><strong>AI 플랫폼:</strong> OpenAI, Google (Gemini), Anthropic.</li>
            <li><strong>소셜 미디어 연동:</strong> Meta (Facebook, Instagram, WhatsApp), Telegram.</li>
        </ul>
        <h2>10. 아동의 개인정보</h2>
        <p>당사의 서비스는 13세 미만의 아동을 대상으로 하지 않으며, 아동으로부터 의도적으로 개인정보를 수집하지 않습니다. 만약 당사가 이러한 정보를 부주의하게 수집했다는 사실을 인지하게 될 경우, 해당 정보를 삭제하기 위한 적절한 조치를 취할 것입니다.</p>
        <p>아동이 당사에 개인정보를 제공했다고 판단되는 경우, 즉시 제12조에 제공된 연락처로 문의해 주시면 해당 데이터를 당사의 기록에서 삭제하기 위한 적절한 조치를 취하겠습니다.</p>
        <h2>11. 개인정보 처리방침의 변경</h2>
        <p>당사는 본 개인정보 처리방침을 수시로 업데이트할 수 있습니다. 중요한 변경 사항이 있을 경우 이 페이지에 새로운 개인정보 처리방침을 게시하여 알려드립니다. 업데이트된 정책은 게시 즉시 효력이 발생합니다.</p>
        <h2>12. 법적 주체 및 연락처</h2>
        <p>"Ruzaani"는 Fernando Alberto Ocampo Romay가 운영하는 상업 브랜드 및 서비스입니다. 데이터 보호법 준수를 위해 Fernando Alberto Ocampo Romay가 Ruzaani 플랫폼을 제공하는 법적 책임 주체입니다.</p>
        <p>본 개인정보 처리방침, 당사의 데이터 관행에 대한 질문이나 우려 사항이 있거나 개인정보 권리를 행사하고자 하는 경우 아래 연락처로 문의해 주십시오:</p>
        <p><strong>책임 주체:</strong> Fernando Alberto Ocampo Romay<br/><strong>이메일:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }
