module Locales.Legal.Terms
    ( getLocaleTerms
    , module Locales.Legal.Prelude
    ) where

import Locales.Prelude (assetPath)
import Locales.Legal.Prelude

commonSEO :: SEO
commonSEO = defaultSEO
    { alternates =
        [ Alternate {hreflang = "en", href = domain <> termsPath EN}
        , Alternate {hreflang = "es", href = domain <> termsPath ES}
        , Alternate {hreflang = "ko", href = domain <> termsPath KO}
        , Alternate {hreflang = "x-default", href = domain <> termsPath EN}
        ]
    , customTags = [lurk|<link rel="stylesheet" href="{assetPath "css/legal.css"}">|]}

effectiveDate :: Language -> Text
effectiveDate EN = "April 25, 2026"
effectiveDate ES = "25 de abril de 2026"
effectiveDate KO = "2026년 4월 25일"

getLocaleTerms :: Language -> LegalLocale
getLocaleTerms EN = LegalLocale
    { seo = commonSEO
        { title = "Ruzaani's Terms of Service"
        , metaTitle = "Terms of Service | Ruzaani - AI Business Intelligence Platform"
        , metaDescription = "Read Ruzaani's Terms of Service to learn about the terms of service, acceptable use policy, and your rights and responsibilities when using our AI Business Intelligence Platform."
        , canonical = Just $ domain <> termsPath EN
        }
    , content = [lurk|
        <h1>Terms of Service</h1>
        <p><strong>Effective Date:</strong> {effectiveDate EN}</p>
        <br><br>
        <p>These Terms of Service ("Terms") govern your access to and use of the Ruzaani website, platform, AI business intelligence tools, and related services (collectively, the "Services"). </p>
        <p>Throughout these Terms, "Ruzaani", "we," "us," or "our" refers to the Ruzaani platform and its operating entity. "Client," "you," or "your" refers to the business, agency, or individual registering for and using the Services.</p>
        <p>By registering for an account or using our Services, you agree to be bound by these Terms. If you do not agree to these Terms, you must not use the Services.</p>
        <h2>1. Description of Services</h2>
        <p>Ruzaani provides a B2B AI-driven business intelligence and communication platform. The Services include, but are not limited to, AI conversational agents, a unified CRM, messaging platform integrations (Meta, Telegram, Email), and behavioral web tracking.</p>
        <h2>2. Account Registration and Security</h2>
        <ol>
            <li><strong>Eligibility:</strong> You must be at least 18 years old and have the legal authority to bind your business or agency to these Terms.</li>
            <li><strong>Account Information:</strong> You agree to provide accurate, current, and complete information during registration and keep it updated.</li>
            <li><strong>Security:</strong> You are strictly responsible for safeguarding your account credentials, API keys, and webhook configurations. We are not liable for any loss or damage arising from your failure to protect your account. You must notify us immediately of any unauthorized use of your account.</li>
        </ol>
        <h2>3. Acceptable Use Policy</h2>
        <p>You agree to use the Services only for lawful business purposes. You shall not:</p>
        <ul>
            <li>Use the Services to send spam, unsolicited promotions, or harassing messages.</li>
            <li>Violate any applicable laws, including data protection regulations (e.g., GDPR, CCPA).</li>
            <li>Reverse-engineer, decompile, or attempt to extract the source code or underlying AI prompts of the platform.</li>
            <li>Use the Services to impersonate any person or entity deceptively.</li>
            <li>Bypass any feature-gating, plan limits, or security mechanisms of the platform.</li>
        </ul>
        <h2>4. Client Responsibilities & End-User Consent</h2>
        <p>As the <strong>Data Controller</strong> of your end-users' data, you are solely responsible for:</p>
        <ul>
            <li><strong>Consent:</strong> Obtaining all legally required consents from your end-users before deploying our Web Tracker on your website or communicating with them via our AI agents.</li>
            <li><strong>Third-Party Compliance:</strong> Complying with the Terms of Service of any third-party integrations you connect to Ruzaani (e.g., Meta's WhatsApp Business Policy, Facebook Platform Terms). We reserve the right to suspend your account if your usage violates these third-party terms and risks our API access.</li>
        </ul>
        <h2>5. Artificial Intelligence Disclaimer</h2>
        <p>Our Services rely on advanced Artificial Intelligence (AI) models. While we strive for high accuracy, you acknowledge that:</p>
        <ul>
            <li>AI-generated responses may occasionally contain errors, inaccuracies, or unexpected outputs ("hallucinations").</li>
            <li><strong>You are solely responsible</strong> for monitoring the automated conversations and the outcomes of the AI agents' interactions with your customers.</li>
            <li>We are not liable for any financial losses, lost sales, misquoted prices, or reputational damage resulting from AI-generated communications.</li>
        </ul>
        <h2>6. Intellectual Property</h2>
        <ul>
            <li><strong>Ruzaani IP & Brand:</strong> We retain all rights, title, and interest in and to the Services, including the platform architecture, algorithms, AI prompts, interface designs, and the "Ruzaani" brand. You may not use our name, logo, or trademarks in your own marketing or claim endorsement without our prior written consent.</li>
            <li><strong>Client Data:</strong> You retain all ownership rights to the data, contacts, and content you input into the Services. You grant us a limited, non-exclusive license to process this data solely to provide the Services to you. <em>(We do not use your proprietary customer data to train our foundational models).</em></li>
            <li><strong>Aggregated Data:</strong> We reserve the right to aggregate and anonymize usage data across our platform to analyze trends, improve our algorithms, and enhance system performance. This aggregated data will never identify you, your agency, or your end-users.</li>
            <li><strong>Feedback:</strong> If you provide us with any feedback, suggestions, or feature requests regarding the Services, you grant us a perpetual, irrevocable, royalty-free license to use and incorporate such feedback into our platform without any obligation or compensation to you.</li>
        </ul>
        <h2>7. Fees and Payments</h2>
        <ul>
            <li><strong>Subscriptions:</strong> The Services are billed on a subscription basis according to the plan tier you select (e.g., Starter, Growth, Business, Agency).</li>
            <li><strong>Billing:</strong> Fees are billed in advance. You authorize us to charge your selected payment method. All fees are non-refundable unless otherwise required by law.</li>
            <li><strong>Modifications:</strong> We reserve the right to modify our pricing. We will provide at least 30 days' notice before any price changes take effect on your next billing cycle.</li>
        </ul>
        <h2>8. Third-Party Integrations</h2>
        <p>The Services interact with third-party platforms (e.g., OpenAI, Meta). We do not control these third parties and are not responsible for their performance. If a third party revokes our API access or changes their terms in a way that limits our Services, we are not liable for any resulting degradation of Service.</p>
        <h2>9. Limitation of Liability</h2>
        <p>TO THE MAXIMUM EXTENT PERMITTED BY LAW, RUZAANI SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, INCLUDING BUT NOT LIMITED TO LOSS OF PROFITS, DATA, OR BUSINESS OPPORTUNITIES, ARISING OUT OF OR IN CONNECTION WITH YOUR USE OF THE SERVICES. OUR TOTAL AGGREGATE LIABILITY FOR ANY CLAIM ARISING OUT OF THESE TERMS SHALL NOT EXCEED THE AMOUNT YOU PAID US IN THE THREE (3) MONTHS PRECEDING THE CLAIM.</p>
        <h2>10. Disclaimer of Warranties</h2>
        <p>THE SERVICES ARE PROVIDED ON AN "AS IS" AND "AS AVAILABLE" BASIS. WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE DO NOT GUARANTEE THAT THE SERVICES WILL BE UNINTERRUPTED, ERROR-FREE, OR 100% SECURE.</p>
        <h2>11. Termination</h2>
        <ul>
            <li><strong>By You:</strong> You may terminate your account at any time via the Admin Dashboard.</li>
            <li><strong>By Us:</strong> We may suspend or terminate your access to the Services at any time, with or without notice, if you violate these Terms or if we suspect fraudulent or illegal activity.</li>
            <li><strong>Effect of Termination:</strong> Upon termination, your right to use the Services will immediately cease, and we may delete your Client Data in accordance with our Privacy Policy.</li>
        </ul>
        <h2>12. Governing Law and Jurisdiction</h2>
        <p>These Terms shall be governed by and construed in accordance with the laws of Mexico. Any disputes arising out of or relating to these Terms or the Services shall be subject to the exclusive jurisdiction of the competent courts in Ciudad de Mexico, Mexico.</p>
        <h2>13. Changes to these Terms</h2>
        <p>We may modify these Terms at any time. We will notify you of material changes by email or through the platform. Your continued use of the Services after the effective date of the updated Terms constitutes your acceptance of the changes.</p>
        <h2>14. Legal Entity & Contact Information</h2>
        <p>"Ruzaani" is a commercial brand and service operated by Fernando Alberto Ocampo Romay. For the purposes of legal compliance, Fernando Alberto Ocampo Romay is the legally responsible entity providing the Ruzaani platform.</p>
        <p>If you have any questions or concerns regarding these Terms, please contact us at:</p>
        <p><strong>Responsible Entity:</strong> Fernando Alberto Ocampo Romay<br/><strong>Email:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }

getLocaleTerms ES = LegalLocale
    { seo = commonSEO
        { title = "Términos y Condiciones de Ruzaani"
        , metaTitle = "Términos y Condiciones | Ruzaani - Plataforma de inteligencia empresarial"
        , metaDescription = "Lee los Términos y Condiciones de Ruzaani para conocer los términos del servicio, la política de uso aceptable y tus derechos y responsabilidades al usar nuestra plataforma de inteligencia empresarial de IA."
        , canonical = Just $ domain <> termsPath ES
        }
    , content = [lurk|
        <h1>Términos y Condiciones</h1>
        <p><strong>Fecha de vigencia:</strong> {effectiveDate ES}</p>
        <br><br>
        <p>Estos Términos y Condiciones ("Términos") rigen su acceso y uso del sitio web, la plataforma, las herramientas de inteligencia empresarial de IA y los servicios relacionados de Ruzaani (colectivamente, los "Servicios").</p>
        <p>A lo largo de estos Términos, "Ruzaani", "nosotros", "nos" o "nuestro" se refiere a la plataforma Ruzaani y a su entidad operadora. "Cliente", "usted" o "su" se refiere a la empresa, agencia o individuo que se registra y utiliza los Servicios.</p>
        <p>Al registrar una cuenta o utilizar nuestros Servicios, usted acepta quedar vinculado por estos Términos. If you do not agree to these Terms, you must not use the Services.</p>
        <h2>1. Descripción de los Servicios</h2>
        <p>Ruzaani ofrece una plataforma B2B de inteligencia empresarial y comunicación impulsada por IA. Los Servicios incluyen, entre otros, agentes conversacionales de IA, un CRM unificado, integraciones con plataformas de mensajería (Meta, Telegram, Email) y rastreo web de comportamiento.</p>
        <h2>2. Registro de Cuenta y Seguridad</h2>
        <ol>
            <li><strong>Elegibilidad:</strong> Debe tener al menos 18 años de edad y contar con la autoridad legal para vincular a su empresa o agencia con estos Términos.</li>
            <li><strong>Información de la Cuenta:</strong> Usted se compromete a proporcionar información precisa, vigente y completa durante el registro y a mantenerla actualizada.</li>
            <li><strong>Seguridad:</strong> Usted es estrictamente responsable de proteger sus credenciales de cuenta, claves API y configuraciones de webhooks. No somos responsables de ninguna pérdida o daño derivado de su falta de protección de la cuenta. Debe notificarnos de inmediato sobre cualquier uso no autorizado de su cuenta.</li>
        </ol>
        <h2>3. Política de Uso Aceptable</h2>
        <p>Usted acepta utilizar los Servicios únicamente para fines comerciales lícitos. Usted no deberá:</p>
        <ul>
            <li>Utilizar los Servicios para enviar spam, promociones no solicitadas o mensajes de acoso.</li>
            <li>Violar cualquier ley aplicable, incluidas las regulaciones de protección de datos.</li>
            <li>Aplicar ingeniería inversa, descompilar o intentar extraer el código fuente o los prompts de IA subyacentes de la plataforma.</li>
            <li>Utilizar los Servicios para suplantar la identidad de cualquier persona o entidad de forma engañosa.</li>
            <li>Eludir cualquier restricción de funcionalidades, límites de plan o mecanismos de seguridad de la plataforma.</li>
        </ul>
        <h2>4. Responsabilidades del Cliente y Consentimiento del Usuario Final</h2>
        <p>Como <strong>Responsable del Tratamiento de Datos</strong> de los datos de sus usuarios finales, usted es el único responsable de:</p>
        <ul>
            <li><strong>Consentimiento:</strong> Obtener todos los consentimientos legalmente requeridos de sus usuarios finales antes de implementar nuestro Web Tracker en su sitio web o comunicarse con ellos a través de nuestros agentes de IA.</li>
            <li><strong>Cumplimiento con Terceros:</strong> Cumplir con los Términos de Servicio de cualquier integración de terceros que conecte a Ruzaani (por ejemplo, la Política de WhatsApp Business de Meta, los Té름의 플랫폼 약관). Nos reservamos el derecho de suspender su cuenta si su uso viola estos términos de terceros y pone en riesgo nuestro acceso a sus APIs.</li>
        </ul>
        <h2>5. Descargo de Responsabilidad sobre Inteligencia Artificial</h2>
        <p>Nuestros Servicios dependen de modelos avanzados de Inteligencia Artificial (IA). Si bien nos esforzamos por lograr alta precisión, usted reconoce que:</p>
        <ul>
            <li>Las respuestas generadas por IA pueden ocasionalmente contener errores, inexactitudes o resultados inesperados ("alucinaciones").</li>
            <li><strong>Usted es el único responsable</strong> de monitorear las conversaciones automatizadas y los resultados de las interacciones de los agentes de IA con sus clientes.</li>
            <li>No somos responsables de ninguna pérdida financiera, ventas perdidas, precios mal cotizados o daños a la reputación derivados de las comunicaciones generadas por IA.</li>
        </ul>
        <h2>6. Propiedad Intelectual</h2>
        <ul>
            <li><strong>PI y Marca Ruzaani:</strong> Nos reservamos todos los derechos, títulos e intereses sobre los Servicios, incluyendo la arquitectura de la plataforma, algoritmos, prompts de IA, diseños de interfaz y la marca "Ruzaani". Usted no puede usar nuestro nombre, logotipo o marcas comerciales en su propio marketing ni afirmar ser avalado por nosotros sin nuestro previo consentimiento por escrito.</li>
            <li><strong>Datos del Cliente:</strong> Usted conserva todos los derechos de propiedad sobre los datos, contactos y contenido que ingrese en los Servicios. Nos otorga una licencia limitada y no exclusiva para procesar estos datos únicamente con el fin de prestarle los Servicios. <em>(No utilizamos los datos privados de sus clientes para entrenar nuestros modelos fundacionales).</em></li>
            <li><strong>Datos Agregados:</strong> Nos reservamos el derecho de agregar y anonimizar los datos de uso de nuestra plataforma para analizar tendencias, mejorar nuestros algoritmos y optimizar el rendimiento del sistema. Estos datos agregados nunca identificarán a usted, su agencia ni a sus usuarios finales.</li>
            <li><strong>Comentarios y Sugerencias:</strong> Si nos proporciona comentarios, sugerencias o solicitudes de funciones sobre los Servicios, nos otorga una licencia perpetua, irrevocable y libre de regalías para usar e incorporar dichos comentarios en nuestra plataforma sin ninguna obligación ni compensación hacia usted.</li>
        </ul>
        <h2>7. Tarifas y Pagos</h2>
        <ul>
            <li><strong>Suscripciones:</strong> Los Servicios se facturan en función del nivel de plan que seleccione (por ejemplo, Starter, Growth, Business, Agency).</li>
            <li><strong>Facturación:</strong> Las tarifas se facturan por adelantado. Usted nos autoriza a cargar su método de pago seleccionado. Todas las tarifas son no reembolsables, salvo que la ley lo exija.</li>
            <li><strong>Modificaciones:</strong> Nos reservamos el derecho de modificar nuestros precios. Le proporcionaremos al menos 30 días de aviso antes de que cualquier cambio de precio entre en vigor en su próximo ciclo de facturación.</li>
        </ul>
        <h2>8. Integraciones con Terceros</h2>
        <p>Los Servicios interactúan con plataformas de terceros (por ejemplo, OpenAI, Meta). No controlamos a estos terceros y no somos responsables de su rendimiento. Si un tercero revoca nuestro acceso a su API o cambia sus términos de una manera que limite nuestros Servicios, no somos responsables de la degradación del Servicio resultante.</p>
        <h2>9. Limitación de Responsabilidad</h2>
        <p>EN LA MÁXIMA MEDIDA PERMITIDA POR LA LEY, RUZAANI NO SERÁ RESPONSABLE DE NINGÚN DAÑO INDIRECTO, INCIDENTAL, ESPECIAL, CONSECUENTE O PUNITIVO, INCLUYENDO, ENTRE OTROS, LA PÉRDIDA DE GANANCIAS, DATOS U OPORTUNIDADES DE NEGOCIO, QUE SURJA O ESTÉ RELACIONADO CON SU USO DE LOS SERVICIOS. NUESTRA RESPONSABILIDAD TOTAL ACUMULADA POR CUALQUIER RECLAMACIÓN QUE SURJA DE ESTOS TÉRMINOS NO EXCEDERÁ EL MONTO QUE NOS HAYA PAGADO EN LOS TRES (3) MESES ANTERIORES A LA RECLAMACIÓN.</p>
        <h2>10. Descargo de Garantías</h2>
        <p>LOS SERVICIOS SE PROPORCIONAN "TAL CUAL" Y "SEGÚN DISPONIBILIDAD". RENUNCIAMOS A TODAS LAS GARANTÍAS, EXPRESAS O IMPLÍCITAS, INCLUYENDO LAS GARANTÍAS DE COMERCIABILIDAD, IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. NO GARANTIZAMOS QUE LOS SERVICIOS SEAN ININTERRUMPIDOS, LIBRES DE ERRORES O 100% SEGUROS.</p>
        <h2>11. Terminación</h2>
        <ul>
            <li><strong>By You:</strong> You may terminate your account at any time via the Admin Dashboard.</li>
            <li><strong>By Us:</strong> We may suspend or terminate your access to the Services at any time, with or without notice, if you violate these Terms or if we suspect fraudulent or illegal activity.</li>
            <li><strong>Effect of Termination:</strong> Upon termination, your right to use the Services will immediately cease, and we may delete your Client Data in accordance with our Privacy Policy.</li>
        </ul>
        <h2>12. Ley Aplicable y Jurisdicción</h2>
        <p>Estos Términos se regirán e interpretarán de acuerdo con las leyes de México. Any disputes arising out of or relating to these Terms or the Services shall be subject to the exclusive jurisdiction of the competent courts in Ciudad de Mexico, Mexico.</p>
        <h2>13. Changes to these Terms</h2>
        <p>We may modify these Terms at any time. We will notify you of material changes by email or through the platform. Your continued use of the Services after the effective date of the updated Terms constitutes your acceptance of the changes.</p>
        <h2>14. Legal Entity & Contact Information</h2>
        <p>"Ruzaani" es una marca comercial y un servicio operado por Fernando Alberto Ocampo Romay. Para fines de cumplimiento legal, Fernando Alberto Ocampo Romay es la entidad legalmente responsable que provee la plataforma Ruzaani.</p>
        <p>If you have any questions or concerns regarding these Terms, please contact us at:</p>
        <p><strong>Responsible Entity:</strong> Fernando Alberto Ocampo Romay<br/><strong>Email:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }

getLocaleTerms KO = LegalLocale
    { seo = commonSEO
        { title = "Ruzaani의 이용약관"
        , metaTitle = "이용약관 | Ruzaani - 인공지능 기반 비즈니스 인텔리전스 플랫폼"
        , metaDescription = "Ruzaani의 서비스 이용 약관, 허용 가능한 사용 정책 및 AI 비즈니스 인텔리전스 플랫폼 사용에 따른 귀하의 권리와 책임에 대해 알아보려면 Ruzaani의 이용 약관을 읽어보십시오."
        , canonical = Just $ domain <> termsPath KO
        }
    , content = [lurk|
        <h1>이용약관</h1>
        <p><strong>시행일:</strong> {effectiveDate KO}</p>
        <br><br>
        <p>본 이용약관("약관")은 귀하의 Ruzaani 웹사이트, 플랫폼, AI 비즈니스 인텔리전스 도구 및 관련 서비스(이하 "서비스")에 대한 접근 및 이용을 규율합니다.</p>
        <p>본 약관 전체에서 "Ruzaani", "당사", "우리"는 Ruzaani 플랫폼 및 그 운영 주체를 의미합니다. "고객", "귀하"는 서비스에 등록하여 이용하는 기업, 기관 또는 개인을 의미합니다.</p>
        <p>계정에 등록하거나 서비스를 이용함으로써 귀하는 본 약관에 동의하는 것으로 간주됩니다. 본 약관에 동의하지 않는 경우, 서비스를 이용하지 마십시오.</p>
        <h2>1. 서비스 설명</h2>
        <p>Ruzaani는 B2B AI 기반 비즈니스 인텔리전스 및 커뮤니케이션 플랫폼을 제공합니다. 서비스에는 AI 대화형 에이전트, 통합 CRM, 메시징 플랫폼 연동(Meta, Telegram, 이메일), 행동 기반 웹 추적이 포함되나 이에 한정되지 않습니다.</p>
        <h2>2. 계정 등록 및 보안</h2>
        <ol>
            <li><strong>자격 요건:</strong> 귀하는 만 18세 이상이어야 하며, 귀하의 기업 또는 기관을 본 약관에 법적으로 구속시킬 권한이 있어야 합니다.</li>
            <li><strong>계정 정보:</strong> 귀하는 등록 시 정확하고 최신의 완전한 정보를 제공하고, 이를 최신 상태로 유지할 것에 동의합니다.</li>
            <li><strong>보안:</strong> 귀하는 계정 자격 증명, API 키 및 웹훅(webhook) 설정을 보호할 전적인 책임이 있습니다. 당사는 귀하의 계정 보호 실패로 인해 발생하는 손실이나 손해에 대해 책임을 지지 않습니다. 귀하는 계정의 무단 사용이 발생할 경우 즉시 당사에 통보해야 합니다.</li>
        </ol>
        <h2>3. 허용 사용 정책</h2>
        <p>귀하는 합법적인 비즈니스 목적으로만 서비스를 이용하는 것에 동의합니다. 귀하는 다음 행위를 하여서는 안 됩니다:</p>
        <ul>
            <li>스팸, 비요청 홍보물 또는 괴롭힘 메시지를 전송하기 위해 서비스를 이용하는 행위.</li>
            <li>데이터 보호 규정을 포함한 적용 가능한 모든 법률을 위반하는 행위.</li>
            <li>플랫폼의 소스 코드 또는 AI 프롬프트를 역설계, 디컴파일하거나 추출하려는 시도.</li>
            <li>서비스를 이용하여 타인 또는 단체를 기만적으로 사칭하는 행위.</li>
            <li>플랫폼의 기능 제한, 플랜 한도 또는 보안 메커니즘을 우회하는 행위.</li>
        </ul>
        <h2>4. 고객 책임 및 최종 사용자 동의</h2>
        <p>귀하의 최종 사용자 데이터에 대한 <strong>개인정보처리자(Data Controller)</strong>로서, 귀하는 다음에 대해 전적인 책임을 집니다:</p>
        <ul>
            <li><strong>동의:</strong> 귀하의 웹사이트에 당사의 웹 트래커를 배포하거나 AI 에이전트를 통해 최종 사용자와 소통하기 전에, 법적으로 요구되는 모든 동의를 최종 사용자로부터 획득해야 합니다.</li>
            <li><strong>제3자 준수:</strong> Ruzaani에 연동하는 모든 제3자 통합 서비스(예: Meta의 WhatsApp Business 정책, Facebook 플랫폼 약관)의 서비스 이용약관을 준수해야 합니다. 귀하의 사용이 이러한 제3자 약관을 위반하여 당사의 API 접근을 위협하는 경우, 당사는 귀하의 계정을 정지할 권리를 보유합니다.</li>
        </ul>
        <h2>5. 인공지능 면책 조항</h2>
        <p>당사의 서비스는 고급 인공지능(AI) 모델에 의존합니다. 당사는 높은 정확도를 위해 노력하지만, 귀하는 다음 사항을 인지하고 동의합니다:</p>
        <ul>
            <li>AI가 생성한 응답은 때때로 오류, 부정확성 또는 예상치 못한 결과("환각")를 포함할 수 있습니다.</li>
            <li><strong>귀하는 전적인 책임을 집니다</strong>: 자동화된 대화 및 AI 에이전트와 고객 간 상호작용의 결과를 모니터링할 책임.</li>
            <li>당사는 AI가 생성한 커뮤니케이션으로 인한 재정적 손실, 판매 기회 상실, 잘못된 가격 제시 또는 평판 손해에 대해 책임을 지지 않습니다.</li>
        </ul>
        <h2>6. 지식재산권</h2>
        <ul>
            <li><strong>Ruzaani IP 및 브랜드:</strong> 당사는 플랫폼 아키텍처, 알고리즘, AI 프롬프트, 인터페이스 디자인 및 "Ruzaani" 브랜드를 포함한 서비스에 대한 모든 권리, 소유권 및 이익을 보유합니다. 귀하는 당사의 사전 서면 동의 없이 당사의 이름, 로고 또는 상표를 귀하의 마케팅에 사용하거나 당사의 보증을 주장할 수 없습니다.</li>
            <li><strong>고객 데이터:</strong> 귀하는 서비스에 입력하는 데이터, 연락처 및 콘텐츠에 대한 모든 소유권을 보유합니다. 귀하는 당사가 서비스를 제공하는 목적으로만 해당 데이터를 처리할 수 있는 제한적이고 비독점적인 라이선스를 당사에 부여합니다. <em>(당사는 귀하의 독점 고객 데이터를 파운데이션 모델 학습에 사용하지 않습니다).</em></li>
            <li><strong>집계 데이터:</strong> 당사는 추세 분석, 알고리즘 개선 및 시스템 성능 향상을 위해 플랫폼 전체의 사용 데이터를 집계 및 익명화할 권리를 보유합니다. 이 집계 데이터는 귀하, 귀하의 기관 또는 귀하의 최종 사용자를 식별하지 않습니다.</li>
            <li><strong>피드백:</strong> 서비스에 대한 피드백, 제안 또는 기능 요청을 제공하는 경우, 귀하는 당사가 해당 피드백을 플랫폼에 사용하고 통합할 수 있는 영구적, 취소 불가능한 무료 라이선스를 부여합니다. 이에 대한 어떠한 의무나 보상도 발생하지 않습니다.</li>
        </ul>
        <h2>7. 요금 및 결제</h2>
        <ul>
            <li><strong>구독:</strong> 서비스는 귀하가 선택한 플랜 등급(예: Starter, Growth, Business, Agency)에 따라 구독 방식으로 청구됩니다.</li>
            <li><strong>청구:</strong> 요금은 선불로 청구됩니다. 귀하는 선택한 결제 수단으로 청구하는 것을 승인합니다. 모든 요금은 법률에서 달리 요구하지 않는 한 환불되지 않습니다.</li>
            <li><strong>변경:</strong> 당사는 가격을 수정할 권리를 보유합니다. 가격 변경이 다음 청구 주기에 적용되기 최소 30일 전에 사전 통지를 제공합니다.</li>
        </ul>
        <h2>8. 제3자 통합</h2>
        <p>서비스는 제3자 플랫폼(예: OpenAI, Meta)과 상호작용합니다. 당사는 이러한 제3자를 통제하지 않으며 그 성능에 대해 책임을 지지 않습니다. 제3자가 당사의 API 접근을 취소하거나 서비스를 제한하는 방식으로 약관을 변경하는 경우, 당사는 그로 인한 서비스 저하에 대해 책임을 지지 않습니다.</p>
        <h2>9. 책임의 제한</h2>
        <p>법률이 허용하는 최대 범위 내에서, RUZAANI는 서비스 이용과 관련하여 발생하는 이익 손실, 데이터 손실, 비즈니스 기회 손실을 포함하되 이에 한정되지 않는 간접적, 우발적, 특별, 결과적 또는 징벌적 손해에 대해 책임을 지지 않습니다. 본 약관에서 발생하는 모든 청구에 대한 당사의 총 누적 책임은 청구 발생 이전 3개월 동안 귀하가 당사에 지불한 금액을 초과하지 않습니다.</p>
        <h2>10. 보증의 거부</h2>
        <p>서비스는 "있는 그대로" 및 "이용 가능한 상태로" 제공됩니다. 당사는 상품성, 특정 목적에의 적합성 및 비침해성에 대한 묵시적 보증을 포함하여 모든 명시적 또는 묵시적 보증을 거부합니다. 당사는 서비스가 중단 없이, 오류 없이 또는 100% 안전하게 제공될 것을 보장하지 않습니다.</p>
        <h2>11. 계약 해지</h2>
        <ul>
            <li><strong>귀하에 의한 해지:</strong> 귀하는 언제든지 관리자 대시보드를 통해 계정을 해지할 수 있습니다.</li>
            <li><strong>당사에 의한 해지:</strong> 귀하가 본 약관을 위반하거나 사기 또는 불법 활동이 의심되는 경우, 당사는 언제든지 사전 통지 유무와 관계없이 서비스 접근을 정지하거나 해지할 수 있습니다.</li>
            <li><strong>해지의 효과:</strong> 해지 시, 서비스 이용 권리는 즉시 소멸되며, 당사는 개인정보 처리방침에 따라 귀하의 고객 데이터를 삭제할 수 있습니다.</li>
        </ul>
        <h2>12. 준거법 및 관할권</h2>
        <p>본 약관은 멕시코 법률에 따라 규율되고 해석됩니다. 본 약관 또는 서비스와 관련하여 발생하는 모든 분쟁은 멕시코 시티(Ciudad de México), 멕시코의 관할 법원의 전속 관할권에 따릅니다.</p>
        <h2>13. 약관의 변경</h2>
        <p>당사는 언제든지 본 약관을 수정할 수 있습니다. 중요한 변경 사항이 있을 경우 이메일 또는 플랫폼을 통해 통지합니다. 변경된 약관의 시행일 이후 서비스를 계속 이용하는 것은 변경 사항에 대한 귀하의 동의로 간주됩니다.</p>
        <h2>14. 법적 주체 및 연락처</h2>
        <p>"Ruzaani"는 Fernando Alberto Ocampo Romay가 운영하는 상업 브랜드 및 서비스입니다. 법적 준수를 위해 Fernando Alberto Ocampo Romay가 Ruzaani 플랫폼을 제공하는 법적 책임 주체입니다.</p>
        <p>본 약관에 관한 질문이나 우려 사항이 있으시면 아래 연락처로 문의해 주십시오:</p>
        <p><strong>책임 주체:</strong> Fernando Alberto Ocampo Romay<br/><strong>이메일:</strong> <a href='mailto:legal@ruzaani.com' target='_blank' class='url'>legal@ruzaani.com</a></p>
        |]
    }
