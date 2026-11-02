import {onCall} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import {Resend} from "resend";

const resendKey = defineSecret("RESEND_API_KEY");

export const sendWelcomeEmail = onCall(
  {secrets: [resendKey]},
  async () => {
    const resend = new Resend(resendKey.value());

    const result = await resend.emails.send({
      from: "PMDD <onboarding@resend.dev>",
      to: "markdevelopers@googlemail.com",
      subject: "PMDD Test Email",
      html: "<h1>Test Email</h1>",
    });

    console.log("RESEND RESULT:", result);

    return {
      success: true,
      result,
    };
  }
);

