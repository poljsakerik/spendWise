import { record, z } from "zod";
import {
  createTRPCRouter,
  publicProcedure,
  protectedProcedure,
} from "~/server/api/trpc";

export const exampleRouter = createTRPCRouter({
  hello: publicProcedure
    .input(z.object({ text: z.string() }))
    .query(({ input }) => {
      return {
        greeting: `Hello ${input.text}`,
      };
    }),

  // insertData: publicProcedure.mutation(async ({ ctx }) => {
  //   const formattedData = data.map((item) => ({
  //     userId: "cljfwfqr90000ok7e9aos672n",
  //     account: "SI56040010043904032",
  //     amount: item.amount * 100,
  //     currency: "",
  //     valueDate: item.valueDate,
  //     postingDate: item.postingDate,
  //     description: item.description,
  //     purposeCode: item.purposeCode,
  //     direction: item.direction,
  //     type: item.type,
  //   }));

  //   return await ctx.prisma.transaction.createMany({
  //     data: formattedData,
  //   });
  // }),

  getAll: publicProcedure.query(({ ctx }) => {
    return ctx.prisma.example.findMany();
  }),

  getSecretMessage: protectedProcedure.query(() => {
    return "you can now see this secret message!";
  }),
});
